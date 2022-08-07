clear;
clc;
pkg load signal

Fs=2000;
fm=5; fc=100;
dt=1/Fs;
kf=50; kp=10;
t=0:dt:2-dt;
N=length(t);

m = sin(10*pi*t);
fm = cos(2*pi*fc*t + 2*pi*kf*cumsum(m).*dt);
pm = cos(2*pi*fc*t + kp*m);

E=diff(fm)*10;
Vo(1)=E(1);
t1=(0:length(E)-1)*dt;
R=[100 1e3 10e3 100e3];
C=1e-6;
for n=1:4
  for i=2:length(E)
    if E(i)>Vo(i-1)
      Vo(i)=E(i);
    else
      Vo(i)=Vo(i-1).*exp(-dt/(2*pi*R(n)*C));
    end
  end
  subplot(4,2,2*n)
  plot(t1,Vo,'linewidth',2,t1,E);grid;axis([0 0.4 -5 5]);
  title('Señal AM y envolvente');
end

subplot(4,2,1)
plot(t,m,'linewidth',2);grid;axis([0 0.4 -1 1]);
title('Salida de modulador');
subplot(4,2,3)
plot(t,fm,'linewidth',2);grid;axis([0 0.4 -1 1]);
title('Salida de FM');
subplot(4,2,5)
plot(t1,E,'linewidth',2);grid;axis([0 0.4 -5 5]);
title('Salida de diferenciador');
  