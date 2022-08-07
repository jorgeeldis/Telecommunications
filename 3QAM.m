clear;
clc;
pkg load signal

dt=0.001;
t = -1:dt:1;
Fs = 1/dt;		
N = length(t);
df = 1/( N*dt);

m=4*sinc(5*t);
n=sin(2*pi*10*t);
c=cos(2*pi*50*t);
s=sin(2*pi*50*t);
y=m.*c+n.*s;

Pm=(1/N)*sum(m.^2);
Pn=(1/N)*sum(n.^2);
Py=(1/N)*sum(y.^2);

M=fft(m)/N; M=fftshift(abs(M));
NN=fft(n)/N; NN=fftshift(abs(NN));
C=fft(c)/N; C=fftshift(abs(C));
S=fft(s)/N; S=fftshift(abs(S));
Y=fft(y)/N; Y=fftshift(abs(Y));
f =linspace(-Fs/2,Fs/2,N);

subplot(4,2,1)
plot(t,m,'linewidth',2);grid;
title('Señal moduladora m(t)');
subplot(4,2,3)
plot(t,n,'linewidth',2);grid;
title('Señal moduladora n(t)');
subplot(4,2,5)
plot(t,c,'linewidth',2,t,s);grid;axis([0 0.15 -1 1])
title('Señales portadoras');
subplot(4,2,7)
plot(t,y,'linewidth',2);grid;
title('Señal modulada');
subplot(4,2,2)
plot(f,M,'linewidth',2);grid;axis([-100 100 0 0.5]);
title('|M(f)|');
subplot(4,2,4)
plot(f,NN,'linewidth',2);grid;axis([-100 100 0 0.5]);
title('|N(f)|');
subplot(4,2,6)
plot(f,C,'linewidth',2,f,S);grid;axis([-100 100 0 0.5]);
title('|C(f)| y |S(f)|');
subplot(4,2,8)
plot(f,Y,'linewidth',2);grid;axis([-100 100 0 0.5]);
title('|Y(f)|');