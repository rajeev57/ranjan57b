close all;
clear ;
clc;
s=serial('COM3');
fclose(s);
fopen(s);
v=imaq.VideoDevice('winvideo',1,'YUY2_640x480','ReturnedColorSpace','rgb');

while(1)
    pause(0.05);
    l=step(v);
    l1=imageprocesses(l);
    l2=imshow(l1);
    [a,b]=bwlabel(l1);  
    if b==1
        b1=regionprops(l1);
        v1=b1(1).Area;
        v2=b1(1).Centroid;
        v2=uint16(v2(1));
        if v1<3000
            %disp('B');
            fwrite(s,'B');%fclose(s);
        elseif v1>4500
            %disp('F');
            %fopen(s );
            fwrite(s,'F');%fclose(s);
        else
            if v2>250
                %disp('R');
                %fopen(s);
              fwrite(s,'R');%fclose(s);
            else
                %disp('L');
                %fopen(s);
                fwrite(s,'L');%fclose(s);
            end
        end
    else
        
        
    end
end