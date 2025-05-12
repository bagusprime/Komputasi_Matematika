% Matriks koefisien A dan vektor konstanta b
A = [10 -1  2  0;
    -1 11 -1  3;
     2 -1 10 -1;
     0  3 -1  8];
b = [6; 25; -11; 15];

% Inisialisasi awal
x0 = zeros(4,1);
tol = 1e-5;
max_iter = 100;

%% Metode Jacobi
x_jacobi = x0;
for k = 1:max_iter
    x_old = x_jacobi;
    for i = 1:4
        sigma = 0;
        for j = 1:4
            if j ~= i
                sigma = sigma + A(i,j) * x_old(j);
            end
        end
        x_jacobi(i) = (b(i) - sigma) / A(i,i);
    end
    if norm(x_jacobi - x_old, inf) < tol
        fprintf('Jacobi selesai dalam %d iterasi\n', k);
        break;
    end
end
disp('Hasil Jacobi:')
disp(x_jacobi)

%% Metode Gauss-Seidel
x_gs = x0;
for k = 1:max_iter
    x_old = x_gs;
    for i = 1:4
        sigma = 0;
        for j = 1:4
            if j ~= i
                sigma = sigma + A(i,j) * x_gs(j);
            end
        end
        x_gs(i) = (b(i) - sigma) / A(i,i);
    end
    if norm(x_gs - x_old, inf) < tol
        fprintf('Gauss-Seidel selesai dalam %d iterasi\n', k);
        break;
    end
end
disp('Hasil Gauss-Seidel:')
disp(x_gs)

% Definisi fungsi
f = @(x) 2*x.^3;

% Parameter
a = 0;
b = 1;
h = 0.1;
x = a:h:b;
y = f(x);

% Riemann kiri
x_left = x(1:end-1);
y_left = f(x_left);
area_left = h * sum(y_left);

% Riemann kanan
x_right = x(2:end);
y_right = f(x_right);
area_right = h * sum(y_right);

% Riemann tengah
x_mid = a + h/2 : h : b - h/2;
y_mid = f(x_mid);
area_mid = h * sum(y_mid);

% Trapesium
trapesium = h * ( (f(1) + f(end))/2 + sum(f(2:end-1)) );

% Tampilkan hasil
fprintf('Luas dengan Riemann kiri     = %.5f\n', area_left);
fprintf('Luas dengan Riemann kanan    = %.5f\n', area_right);
fprintf('Luas dengan Riemann tengah   = %.5f\n', area_mid);
fprintf('Luas dengan aturan trapesium = %.5f\n', area_trapz);
