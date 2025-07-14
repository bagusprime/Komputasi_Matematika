clear; clc; 

% 1. Baca data dari Excel 
[~, ~, raw] = xlsread('bitcoin-historical-data.xlsx');  

% Ekstrak kolom 

open = cell2mat(raw(2:end,2));                % Kolom 2: Open
high = cell2mat(raw(2:end,3));                % Kolom 3: High
low = cell2mat(raw(2:end,4));                 % Kolom 4: Low
close = cell2mat(raw(2:end,5));               % Kolom 5: Close
market_cap = cell2mat(raw(2:end,6));          % Kolom 6: Market Cap

% 2.  Dataset Input-Output
X_raw = [open(1:end-1), high(1:end-1), low(1:end-1), close(1:end-1), market_cap(1:end-1)]';
Y_raw = close(2:end)';

% 3. Normalisasi dengan mapminmax
[X_all, psX] = mapminmax(X_raw, 0, 1);
[Y_all, psY] = mapminmax(Y_raw, 0, 1);

% 3. PEMBAGIAN DATA (70% Training - 30% Testing)
total_samples = size(X_all, 2);
train_count = round(0.7 * total_samples);
testInd = train_count+1 : total_samples;


% Langkah 4: Buat dan konfigurasi model ANN 5-12-1 
net = feedforwardnet(12, 'trainlm');              % 12 neuron di hidden layer

% Konfigurasi fungsi aktivasi, epoch, learning rate, momentum
net.layers{1}.transferFcn = 'purelin';            % Hidden layer pakai purelin (linear)
net.trainParam.epochs = 80;                       % Epoch = 80
net.trainParam.lr = 0.5;                          % Learning rate = 0.5
net.trainParam.mc = 0.2;                          % Momentum = 0.2

% Pembagian data manual (sesuai indeks)
net.divideFcn = 'divideind';                      % Membagi berdasarkan indeks manual
net.divideParam.trainInd = 1:train_count;         % Indeks data training
net.divideParam.valInd = []  ;                      % Menggunakan data validasi
net.divideParam.testInd = testInd;  % Indeks data testing

%  Langkah 5: Latih jaringan
net = train(net, X_all, Y_all);                   % Latih dengan semua data (proses forward pass, backward pass, minimasi eror)

% Langkah 6: Prediksi dan denormalisasi 
Y_pred_all = net(X_all);                          % Prediksi semua data
Y_pred_denorm = mapminmax('reverse', Y_pred_all, psY);                     % Denormalisasi hasil prediksi
Y_test_denorm = mapminmax('reverse', Y_all(net.divideParam.testInd), psY); % Denormalisasi Y test asli

% Langkah 7: Hitung MAPE, RMSE, MAE
error_test = Y_test_denorm - Y_pred_denorm(net.divideParam.testInd);  % Selisih prediksi dan aktual
mape = mean(abs(error_test ./ Y_test_denorm)) * 100;                  % Mean Absolute Percentage Error
rmse = sqrt(mean(error_test .^ 2));                                   % Root Mean Squared Error
mae = mean(abs(error_test)); 
ss_res = sum((error_test).^2);
ss_tot = sum((Y_test_denorm - mean(Y_test_denorm)).^2);
r2 = 1 - (ss_res / ss_tot);

% Deteksi Prediksi Tidak Sesuai (misalnya error > 5%)
threshold_error = 0.05;  % ambang batas toleransi (5%)
bad_preds = find(abs(error_test ./ Y_test_denorm) > threshold_error);
jumlah_tidak_sesuai = length(bad_preds);

% Langkah 8: Tampilkan hasil evaluasi
fprintf('=== EVALUASI MODEL (Data Testing) ===\n');
fprintf('MAPE : %.4f %%\n', mape);
fprintf('RMSE : %.4f\n', rmse);
fprintf('MAE  : %.4f\n\n', mae);
fprintf('R-Squared (R?): %.4f\n', r2);
fprintf('Jumlah prediksi tidak sesuai (>5%% error): %d dari %d data\n', ...
        jumlah_tidak_sesuai, length(Y_test_denorm));

% Grafik Perbandingan
figure;
plot(Y_test_denorm, 'b', 'DisplayName', 'Aktual');
hold on;
plot(Y_pred_denorm(net.divideParam.testInd), 'r--', 'DisplayName', 'Prediksi');
legend show;
title('Perbandingan Data Aktual vs Prediksi (Testing)');
xlabel('Waktu');
ylabel('Harga Close');
grid on;
% Tampilkan grafik error absolut ===
figure;
plot(abs(error_test ./ Y_test_denorm) * 100, 'k');
line([1, length(Y_test_denorm)], [threshold_error * 100, threshold_error * 100], ...
     'Color', 'r', 'LineStyle', '--');
text(5, threshold_error * 100 + 0.5, 'Threshold 5%', 'Color', 'r');
title('Error Persentase Prediksi per Hari');
xlabel('Index Hari');
ylabel('Persentase Error (%)');
grid on;

% 10. Ambil data terakhir (fitur input hari terakhir)
last_input = [open(end), high(end), low(end), close(end), market_cap(end)]';

% 11. Normalisasi data terakhir menggunakan parameter sebelumnya
last_input_norm = mapminmax('apply', last_input, psX);

% 12. Prediksi harga close hari berikutnya (dalam skala normalisasi)
next_close_norm = net(last_input_norm);

% 13. Kembalikan ke skala asli (invers normalisasi)
next_close_pred = mapminmax('reverse', next_close_norm, psY);

% 14. Tampilkan hasil prediksi
fprintf('Prediksi harga Close Bitcoin untuk hari berikutnya adalah: %.2f\n', next_close_pred);

