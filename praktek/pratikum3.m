%if end (basic if)
n = input('nilai : ');
if n > 70 
    disp('anda lulus');
end
    disp('coba lagi');

%if else end (if dengan tambahan else)
n = input ('nilai : ');
if n > 70 
    disp ('anda lulus');
else
    disp('coba lagi');
end

%if elsif else end (if dengan tambahan elsif)
n = input('tinggi : ');
if n >= 190
    disp('sangat tinggi');
elsif n > 160 && n < 190 
    disp('pendek');
else 
    disp('mini');
end

%switch
hitungan = input('operasi : ');
a = 2;
b = 3;
switch hitungan
    case 1
        y = a+b;
        disp(y);
    case 2
        y = a-b;
        disp(y);
    case 3
        y = a*b;
        disp(y);
    otherwise
        disp('bukan piihan');
end

%Loop
%for 1
    for i = 1:10
        disp(i);
    end
    
    %for 2
    a = 0;
    for i = 1:5
        a = a+i;
    end
    disp(a);
         

    %continue
    a = 0;
    for i = 1:5
        if i == 2
            continue
        else
            a = a+i;
        end
    end
    disp(a);
    
     %break
    for i = 1:10
        if i == 5
            break
        else
            disp(i);
        end
    end


