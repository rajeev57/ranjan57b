clc
clear
close all;

import java.awt.Robot
import java.awt.event.*;
abc=Robot();%object

abc.mouseMove(500,750);
abc.mousePress(InputEvent.BUTTON2_MASK);
pause(0.002)
abc.mouseRelease(InputEvent.BUTTON2_MASK);

pause(2)

abc.mouseMove(400,400);
while(1)
abc.mouseWheel(int8(-10000));
pause(0.2)
end