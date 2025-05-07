function [x, galat] = Posisipalsuu(f, x, N, tol)
if nargin < 4, tol = 1e-3; end
if nargin < 3, N = 100; end

a = x(1)
b = x(2)
fa = f(a)
fb = f(b)

if fa * fb > 0
    error('fungsi tidak berupa tanda d interval, pilih interval lain');
end

x = a; %inisialisasi
galat = 1;
n = 1;

while n <= N && galat > tol
    xold = x
    x = b - fb * (b - a)/ (fb - fa);
    fx = f(x);
    
    if fa * fx <0
        b = x;
        fb = fx
    elseif fx * fb < 0 
        a = x;
        fa = fx;
    else
        galat = 0;
        break;
    end
    
    galat = abs((x - xold/x)) * 100;
    n = n + 1;
end
end
        
    
