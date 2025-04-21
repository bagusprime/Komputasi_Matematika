%Nama : Johannes Bagus Pramindra
%NIM : 66202302
%username : bagusprime

nilai = input('Masukkan nilai Anda: ');

if nilai >= 0 && nilai <= 100
    if nilai >= 80
        disp('Grade: A');
    elseif nilai >= 65
        disp('Grade: B');
    elseif nilai >= 50
        disp('Grade: C');
    else
        disp('Grade: D');
    end
else
    disp('Nilai tidak valid');
end

x = 1;
jumlah = 0;

while x <= 5
    jumlah = jumlah + x;
    x = x + 1;
end

fprintf('Jumlah total dari 1 sampai 5 adalah: %d\n', jumlah);