clc
clear all
close all

%baseband wander points for 10 sec
x=[43 225 408 594 786 962 1141 1320 1501 1686 1866 2038 2213 2391 2570 2759 2934 3111 3290 3472 3657 3839 4013 4189 4366 4417 4737 4917 5092 5272 5452 5642 5830 6008 6185 6365 6537 6736 6916 7090 7265 7449 7626 7811 7892 8156 8331 8501 8700 8833];
y=[3.17 1.6 1.87 -0.48 -4.88 -0.32 3.36 2.08 1.28 -3.89 -1.81 4.83 2.24 1.68 0.08 -5.28 -0.99 2.77 1.84 1.09 -4.4 -2.96 4.24 2.32 1.6 0.48 -5.73 -1.97 3.02 2.27 0.32 -4.21 -3.52 5 2.64 1.36 0.48 -5.49 -1.89 3.68 1.92 1.09 -1.52 -3.76 1.52 2.72 1.28 1.02 -4.75 -2.83];
time=x*0.0033;
L=length(time);
disp(L);
%resample using resample method
desired_freq=4;
[y1,Ty]=resample(y,time,desired_freq);
figure(2)
plot(Ty,y1);
L=length(y1);
disp(L);
f = desired_freq*(0:(L/2))/L;
figure,plot(x,y);
%take fft
value=fft(y1);
P2=abs(value/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
figure(3)
plot(f,P1);

