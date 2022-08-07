clear;
clc;
pkg load signal

dt=0.001; 
t = -1:dt:1;
N = length(t); 
Fs = 1/dt;

m=2*sinc(5*t);
c=cos(2*pi*50*t);
y=m.*c;

cd=zeros(5,N); yd=cd; Py=zeros(1,N); yo=cd;
ang=[0 30 45 60 90]*pi/180;
[b, a] = butter (4, 20/Fs);

for i=1:5
  cd(i,:)=cos(2*pi*50*t+ang(i));
  yd(i,:)=y.*cd(i,:);
  yo(i,:)=filter(b,a,yd(i,:));
  Py(i)=(1/N)*sum(yo(i,:).^2);
end

subplot(6,1,1)
plot(t,m,'linewidth',2);grid;
ylim([-2 3]);
subplot(6,1,2)
plot(t,yo(1,:),'linewidth',2);grid;
ylim([-2 3]);
subplot(6,1,3)
plot(t,yo(2,:),'linewidth',2);grid;
ylim([-2 3]);
subplot(6,1,4)
plot(t,yo(3,:),'linewidth',2);grid;
ylim([-2 3]);
subplot(6,1,5)
plot(t,yo(4,:),'linewidth',2);grid;
ylim([-2 3]);
subplot(6,1,6)
plot(t,yo(5,:),'linewidth',2);grid;
ylim([-2 3]);