% Conversión analógica a digital
% Muestreo / cuantización lineal / codificación PCM
% Requiere los pkg signal, control, communications
% Carlos A. Medina C. 2021
pkg load signal
pkg load control
pkg load communications
clc; clear;
% Señal "analógica"
f = 10;   % frecuencia fundamental
dt=1/(100*f);
t=0:dt:20/f;
s=cos(2*pi*f*t+pi/3)+sin(2*pi*2*f*t+pi/4);  %Señal "analógica"

k=1.75;            % factor de muestreo
fs = k*(2*f);      % frecuencia de muestreo
sf= round((1/fs)/dt); % factor de muestreo
sd=s(1:sf:end);       % señal muestreada
td=t(1:sf:end);       % soporte de la señal muestreada

% Cuantizador
l=4;     % bit/palabra
Vp=max(abs(s));    % voltaje pico
DR=2*Vp; % rango dinamico
L=2^l;   % número de niveles
q=DR/L;  % escalón

x=sd;  % muestras
x(x>Vp) = Vp-q/2;   % saturación
x(x<-Vp)=-Vp+q/2;
Q=q*(floor(x/q)+0.5);
nivel=uint8((Q-q/2)/q+(L/2));
cod=dec2bin(nivel);


subplot(2,2,1)
v=[0 2/f -Vp Vp];
plot(t,s,'linewidth',2);axis(v);hold on
stem(td,sd,'*');hold on;
scatter(td,Q,50,'r','filled');grid;
title('Señal analógica y muestras');

S=fftshift(abs(fft(s)))/length(s);
Fs=1/dt;
f1=linspace(-floor(Fs/2),ceil(Fs/2),length(s));

sd=upsample(sd,sf);     % señal muestreada para calcular el espectro
sd=sd(1:length(s));
Sd=fftshift(abs(fft(sd)))/length(td);

subplot(2,2,2)
vf=[-100 100 0 1];
plot(f1,S,'linewidth',2,f1,Sd);grid; axis(vf);
legend('Señal banda-base','Señal muestreada');
title('Espectros de magnitud');

printf ("Modulación por codificación de pulso\n");
printf ("Frecuencia de muestreo fs = %4.2f fmax\n",k);
printf ("Cuantizador lineal con L = %3d niveles\n\n",L);
printf ("   x(t)      Q(x)   Nivel  PCMcode\n");
for i=1:length(x)
  printf ("% 8.6f % 8.6f  %3d   %s\n",x(i),Q(i),nivel(i),cod(i,:));
end
printf ("\n");
