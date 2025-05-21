[x, y] = meshgrid(-6:0.1:6, -6:0.1:6);
f = (x.^2 + y - 11).^2 + (x + y.^2 - 7).^2;

figure; surf(x, y, f); title('Himmelblau''s Function'); shading interp;
figure; contour(x, y, f, 50); title('Contour of Himmelblau''s');

[x, y] = meshgrid(-5.12:0.1:5.12, -5.12:0.1:5.12);
f = 20 + x.^2 - 10*cos(2*pi*x) + y.^2 - 10*cos(2*pi*y);

figure; surf(x, y, f); title('Rastrigin Function'); shading interp;
figure; contour(x, y, f, 50); title('Contour of Rastrigin');

[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
f = -20 * exp(-0.2*sqrt(0.5*(x.^2 + y.^2))) - ...
    exp(0.5*(cos(2*pi*x) + cos(2*pi*y))) + exp(1) + 20;

figure; surf(x, y, f); title('Ackley Function'); shading interp;
figure; contour(x, y, f, 50); title('Contour of Ackley');

[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);
f = (x + 2*y - 7).^2 + (2*x + y - 5).^2;

figure; surf(x, y, f); title('Booth Function'); shading interp;
figure; contour(x, y, f, 50); title('Contour of Booth');

[x, y] = meshgrid(-4.5:0.1:4.5, -4.5:0.1:4.5);
f = (1.5 - x + x.*y).^2 + (2.25 - x + x.*y.^2).^2 + (2.625 - x + x.*y.^3).^2;

figure; surf(x, y, f); title('Beale Function'); shading interp;
figure; contour(x, y, f, 50); title('Contour of Beale');