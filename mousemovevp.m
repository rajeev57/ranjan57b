clc
clear
close all;

import java.awt.Robot
import java.awt.event.*;
abc=Robot();%object

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
[b1 a1]=bwlabel(l7);
if a1==1
    fd=regionprops(l7);
    v1=fd.Centroid;
    kp=uint16(v1(1));
    kp1=uint16(v1(2));
    abc.mouseMove(kp,kp1);
    
    l8=imageprocess(V);
    imshow(l8);
    [c d]=bwlabel(l8);
    if d==2
      gd=regionprops(l8);
      v2=gd.Centroid;
    kp2=uint16(v2(1));
    kp12=uint16(v2(2));
    
    if kp>kp2
        abc.mousePress(InputEvent.BUTTON2_MASK);
         pause(0.002)
        abc.mouseRelease(InputEvent.BUTTON2_MASK);
    else
        kp<kp2
        abc.mousePress(InputEvent.BUTTON3_MASK);
         pause(0.002)
        abc.mouseRelease(InputEvent.BUTTON3_MASK);
    end
    end
end
end

