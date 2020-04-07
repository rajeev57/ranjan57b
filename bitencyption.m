  close all;
clear all;
clc;

%image1
a=imread('rahul.jpg');
c=imresize(a,[500,500]);
[e,f,u]=size(c);

%word encyption:
d='ironfist';
d = strtrim(d);
m = length(d) * 8;
a1 = uint8(d); 
bs = transpose(dec2bin(a1,8));
bs = bs(:);
N = length(bs);
c1 = zeros(N,1);%b is a vector of bits
    for k = 1:N
        if(bs(k) == '1')
            c1(k) = 1;
        else
            c1(k) = 0;
        end
    end

p=1;
%image information convert into binary
    for j1=1:1:N
        s=dec2bin(c(1,j1));
        l=str2num(s);
        l1=bitset(l,1,c1(j1,1));
        s1=num2str(l1);
        c(1,j1)=bin2dec(s1);
        p=p+1;
    end;


%[e,f]=size(c);

imwrite(c,'rahul1.bmp');
imtool(c);




