%kalkulus sederhana
%limit
%contoh 1
syms x
limit((x^3+5)/(x^4+7))
%
%contoh 2
%limit ((
%
%contoh 3
syms x
f =(3*x+5)/(x+3);
g = x^2+1;
l1=limit(f,4)
l2=limit(g,4)
1tambah = limit(f+g,4)
1kurang = limit(f-g,4)
1kali    = limit(f*g,4)
1bagi   = limit(f/g,4)

%turunan
%syms t
%f = 3*t*2 + 
%diff(f,t)

%sifat turunan
syms x
syms t

f = (x + 2) *(x^2 + 3)
det1 = diff(f)

f = (x^2 + 3) * (sqrt(t)
det2 = diff(f)

f = (cx^2 - 2*x + 1)*(3*x^3 - 3*x^2 + 2)
dset3 = diff(f)

f = 







%turunn parsial
syms x y;

% definisi fungsi
f = x^2 + 3^x*y + y^3;


df_dx = gradient(f, x);


df_dy = gradient(f, y);

disp('turuna parsial terhadap x = ');
disp(df_dx);
disp('turuna parsial terhadap y = ');
disp(df_dy);



%integral 
%tak tentu
syms x;
%
%definisi fungsi
f = x^2;

%menghitung hasi
F = int(f, x);
%
disp('integral tak tentu dari f(x) = x^2 : ';


f = @(x) 2*x.*2;

a = 0;
b = 1;

result = integral(f, a, b);

disp(('integral dari f(x) '

