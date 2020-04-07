function [ d ] = imageprocesses( k1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    c=rgb2gray(k1);
    
    k=k1(:,:,2);% for rgb image we select green plane
    
    j=imsubtract(k,c);
    
    %the difference is less b/w green and black

    m=medfilt2(j,[2,2]);%median of the image to make for perscsion
    
    l1=immultiply(m,5);% to increase the difference

    l2=im2bw(l1,0.3); %this worked on threshold value
    
    l3=bwareaopen(l2,50);
    
    l4=imdilate(l3,strel('disk',6));
    
    l5=imclose(l4,strel('square',100));
    
    l6=imfill(l5,'holes');
    
    d=flip(l6,2);
    

end

