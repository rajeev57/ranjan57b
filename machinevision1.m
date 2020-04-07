clc
clear
% import java.awt.Robot
% import java.awt.event.*;
% abc=Robot();%object
s=serial('COM3');
fclose(s);
fopen(s);
%f=fread(s);

V=imaq.VideoDevice('winvideo',1,'YUY2_640x480','ReturnedColorSpace','rgb');

while(1)
    
    pause(0.05);
    wq=step (V);

c=rgb2gray(wq);
k=wq(:,:,2);
j=imsubtract(k,c);
%the difference is less b/w green and black
l=medfilt2(j,[2,2]);
l1=immultiply(l,5);
%imtool(l1);

l2=im2bw(l1,0.25);
l3=bwareaopen(l2,30);
l4=imdilate((l3),strel('disk',6));
l5=imclose(l4,strel('square',100));
l6=imfill(l5,'holes');
l7=flip(l6,2);

imshow(l7);
[b1,a1]=bwlabel(l7);
if a1==1
fd=regionprops(l7);
    v1=fd.Area;
    v2=fd.Centroid;

    
    if v1>4000
       % disp('forword');
       
      
        fwrite(s,'F');
     
    
    
    elseif v1<3000
    %    disp('backword');
       fwrite(s,'B');
       
     else 
         
         if v2(1)>230
        %     disp('right');
       fwrite(s,'R');
         
         else
        % disp('left');
        fwrite(s,'L');
      
         end
    end
end
end
    
    
    
    
    
    