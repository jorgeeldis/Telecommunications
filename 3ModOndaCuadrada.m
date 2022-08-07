clear;
clc;
pkg load signal

Fs=2000;
fm=5; fc=100;
dt=1/Fs;
kf=50; kp=10;
t=0:dt:2-dt;
N=length(t);

T=dt:dt:0.2;
mT=(T>=0.1-dt/2 & T<=0.2+dt/2);
m=[0 mT mT mT mT mT mT mT mT mT mT];
m=m(1:end-1);

fm = cos(2*pi*fc*t + 2*pi*kf*cumsum(m).*dt);
pm = cos(2*pi*fc*t + kp*m);

M=fft(m)/N; M=abs(M(1:N/2));
FM=fft(fm)/N; FM=abs(FM(1:N/2));
PM=fft(pm)/N; PM=abs(PM(1:N/2));
f=linspace(0,Fs/2,length(M));

subplot(3,2,1)
plot(t,m,'linewidth',2);grid;
title('Señal moduladora');axis([0 0.4 -1 1]);
subplot(3,2,3)
plot(t,fm,'linewidth',2);grid;
title('Señal FM');axis([0 0.4 -1 1]);
subplot(3,2,5)
plot(t,pm,'linewidth',2);grid;
title('Señal PM');axis([0 0.4 -1 1]);
subplot(3,2,2)
plot(f,M,'linewidth',2);grid;
title('Señal moduladora');axis([0 200 0 0.15]);
subplot(3,2,4)
plot(f,FM,'linewidth',2);grid;
title('Señal FM');axis([0 200 0 0.15]);
subplot(3,2,6)
plot(f,PM,'linewidth',2);grid;
title('Señal PM');axis([0 200 0 0.15]);