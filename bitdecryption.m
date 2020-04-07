 close all;
clear all;
a=imread('rahul1.bmp');
[e,f,u]=size(a);

for j1=1:1:64
    s=dec2bin(a(1,j1));
    l=str2num(s);
    l1(j1,1)=bitget(l,1);
end;

binvalue = [ 128 64 32 16 8 4 2 1 ];
m1 = reshape(l1,8,8);
%m1=transpose(m1);
display(m1);
text = char(binvalue*m1);

disp(['this is the word  = ',text]);


        