clear;
clc;
pkg load signal

dt=0.001; 
t = -1:dt:1; 
Fs = 1/dt;		
N = length(t); 
df = 1/(N*dt);

m=2*sinc(5*t);
c=cos(2*pi*50*t);
y=m.*c;

Pm=(1/N)*sum(m.^2); 
Py=(1/N)*sum(y.^2);

M=fft(m)/N; M=fftshift(abs(M));
C=fft(c)/N; C=fftshift(abs(C));
Y=fft(y)/N; Y=fftshift(abs(Y));
f =linspace(-Fs/2,Fs/2,N);

Sm=20*log10(M);
Sc=20*log10(C);
Sy=20*log10(Y);

printf('Potencia promedio de la señal moduladora %5.2f \n',Pm);
printf('Potencia promedio de la señal modulada   %5.2f \n',Py);

subplot(3,2,1)
plot(t,m,'linewidth',2);grid;
title('Señal moduladora');
subplot(3,2,3)
plot(t,c,'linewidth',2);grid;
xlim([0 0.5]);
title('Señal portadora')
subplot(3,2,2)
semilogy(f,Sm,'linewidth',2);grid;
xlim([-100 100]);
ylim([-10^2 -10^1]);
title('PSD Señal moduladora');
subplot(3,2,4)
semilogy(f,Sc,'linewidth',2);grid;
xlim([-100 100]);
ylim([-10^2 -10^1]);
title('PSD Señal portadora');
subplot(3,2,5)
plot(t,y,'linewidth',2);grid;
title('Señal modulada');
subplot(3,2,6)
semilogy(f,Sy,'linewidth',2);grid;
title('PSD Señal modulada');
xlim([-100 100]);
ylim([-10^2 -10^1]);

%Delimitar la portadora 
%Modulación de frecuencia hay que poner el eje y logarítmico y el eje x normal