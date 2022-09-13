function out = autobase_capno1()
load('0330_8min.mat');
fs=300;
%i=input('which dataset chosen');
y=signal.pleth.y(1:144001,:);
x=linspace(0,480,144001);
%x=linspace(0,60,18000);
figure(1);
plot(x,y);
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
%figure(2);
%plot(inp.x,inp.y);

for i=1:size(inp.peaks)-1
j=inp.peaks(i);
a1(i)=inp.y(j);
% k=inp.peaks(i+1);
% a2=inp.y(k);
t1(i)=inp.x(j);
% t2=inp.x(k);
end
% for i=1:size(inp.peaks)-1
% j=inp.peaks(i);
% t1(i)=inp.x(j);
% end
 figure(3);
co2=signal.co2.y;
plot(x,co2);hold on
 plot(t1,a1); 
 hold off
figure(4);
plot(t1,a1,'r');hold on
plot(x,y); hold off
tf = islocalmin(a1);
onsx=t1(tf);
onsy=a1(tf);
%onsy(onsy>=-mean(onsy))=[];
figure(5)
plot(t1,a1,onsx,onsy,'r*');hold on
plot(x,y); hold off
tdiff1=onsx(1)-0
for i=1:size(onsx(1,:)')-1
    onst1=onsx(i);
    onst2=onsx(i+1);
    tdiff(i)=onst2-onst1;
end
disp(tdiff)
hold on;
plot(x,y);
hold off;

% plot(t1,a1,'r');
X=300*t1;
Y=a1;
ym=mean(Y);
Y=Y-ym;
time=X*0.0033;
L=length(time);
%resample using resample method
desired_freq=4;
[y1,Ty]=resample(Y,time,desired_freq);
figure(5)
plot(Ty,y1);
L=length(y1);
f = desired_freq*(0:(L/2))/L;
%figure,plot(x,y);
resamp_b.y= y1;
resamp_b.x=Ty;
fpass = [0.2,1.5];
y1=bandpass(y1,fpass,4);
%take fft
value=fft(y1);
P2=abs(value/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
figure(6)
plot(f,P1);
[maxY, indexOfMaxY] = max(P1);
breathx = f(indexOfMaxY)*60
end