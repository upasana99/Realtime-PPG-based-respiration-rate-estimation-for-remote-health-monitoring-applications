clc
close all
clear all
%function out = autobase_capno2()
load('0309_8min.mat');
fs=300;
%i=input('which dataset chosen');
y=signal.pleth.y;
x=linspace(0,length(y)/fs,length(y));
figure(1);
plot(x,y)
h=gcf;
axObj = get(h, 'Children');
datObj = get(axObj, 'Children');
xdata = get(datObj, 'XData');
ydata = get(datObj, 'YData');
inp.y=(ydata)';
inp.x=(xdata)';
[peaks onsets]=IMS(y,fs);
inp.peaks=peaks;
inp.onsets=onsets;
% figure(2);
% plot(inp.x,inp.y);
amp_mod=(y(peaks)+y(onsets))/2;
amp_time=(x(peaks)+x(onsets))/2;
figure(4);
plot(amp_time,amp_mod);

co2=signal.co2.y;
co2_plot=co2;
mean_co2=mean(co2_plot);
for i=1:size(co2_plot)
    if(co2_plot(i)> mean_co2)
        co2_plot(i)=mean_co2;
        
   end
end


[amp_y1,amp_T]=resample(amp_mod,amp_time,10);

mean_midy=mean(amp_y1);
for i=1:size(amp_y1)
    if(amp_y1(i)> mean_midy)
        amp_y1(i)=mean_midy;
       
   end
end

tf = islocalmin(amp_y1);
 onsx=amp_T(tf);
 onsy=amp_y1(tf);
 figure(7);
 plot(amp_T,amp_y1,onsx,onsy,'r*');
 onsx=onsx';

 figure(3);
% plot(x,co2_plot);
% tf_co2 = islocalmin(co2_plot);
% onsx_co2=x(tf_co2);
% onsy_co2=co2(tf_co2);
% plot(x,co2_plot,onsx_co2,onsy_co2,'r*');
for i=1:size(co2)
    k=1;
    for co2=co2(i:i+5)
        tf_co2 = islocalmin(co2);
        onsx_co2=x(tf_co2);
        onsy_co2=co2(tf_co2);
%         m(k)=min(onsy_co2);
%      k=k+1;
    end
end
          
    
    
% Moving average filter
for i=1:(length(co2_plot)-fs/5)
local_sum=0;
for j=1:fs/5
local_sum=local_sum+co2_plot(i+j);
end
co2_plot(i)=local_sum/(fs/5);
end

onsx_co2=onsx_co2';    
for i=1:size(onsx)-1
breath_cycle(i)= onsx(i+1)-onsx(i);
end
for i=1:size(onsx_co2)-1
GT(i)= onsx_co2(i+1)-onsx_co2(i);
end
