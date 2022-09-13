clc
clear all
close all

%load data containing co2,pleth,ecg data
%check for sampling rate in parameters
signal=load('0331_8min.mat');

%extract co2 signal from struct signal
co2=signal.signal.co2.y;
new_co2=co2(1:18000,:); %take first 18000 instances
figure(1);
 %subplot(211)
plot(new_co2,'LineWidth',2);
xlabel('Time (sec)')

%extract PPG signal
signal1=signal.signal.pleth.y;
new_signal=signal1(6001:9000,:);
figure(2);
 %subplot(212)
plot(new_signal,'LineWidth',3);
xlabel('Time (sec)')

x=[43 225 408 594 786 962 1141 1320 1501 1686 1866 2038 2213 2391 2570 2759 2934 3111 3290 3472 3657 3839 4013 4189 4366 4417 4737 4917 5092 5272 5452 5642 5830 6008 6185 6365 6537 6736 6916 7090 7265 7449 7626 7811 7892 8156 8331 8501 8700 8833];
y=[3.17 1.6 1.87 -0.48 -4.88 -0.32 3.36 2.08 1.28 -3.89 -1.81 4.83 2.24 1.68 0.08 -5.28 -0.99 2.77 1.84 1.09 -4.4 -2.96 4.24 2.32 1.6 0.48 -5.73 -1.97 3.02 2.27 0.32 -4.21 -3.52 5 2.64 1.36 0.48 -5.49 -1.89 3.68 1.92 1.09 -1.52 -3.76 1.52 2.72 1.28 1.02 -4.75 -2.83];
% x1=[78 100]/1600;
% y1=[-5.89 4.05];
% annotation('line',x1,y1);

% x1=[43 225 408 594 786 964 1139 1318 1501 1685 1865 2037 2212 2390 2570 2760 2933 3111 3290 3472 ]
% y1=[3.17 1.6 1.81 -0.84 -4.88 0.85 2.24 1.47 1.28 -3.89 -2.24 4.21 1.68 1.12 0.08 -5.28 -1.98 2.19 1.84 1.09 ]  