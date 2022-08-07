% Limpiando variables
clear;
clc;

N=1000; % Número de puntos de la señal (longitud en el tiempo)
Fs=1000; % Frecuencia de Muestreo 1kHz
dt=1/Fs; % Periodo de Muestreo
T=N*dt; % Tiempo total de la señal
t=(0:N-1)*dt; % Intervalo de la señal en tiempo
df=1/T; % Resolucion de frecuencia

x=0.8*cos(2*pi*100*t) + 1.2*sin(2*pi*200*t); % Señal
X=fft(x)/N; % Transformada Discreta de Fourier
X1=2*abs(X(1:length(X)/2)); % Espectro de Amplitud de un Solo Lado
X2=fftshift(abs(X)); % Espectro de Amplitud de un Doble Lado
f1=0:df:Fs/2-df; % Soporte: vector de frecuencias positivas
f2=-Fs/2:df:Fs/2-df; % Soporte: vector de frecuencias

v=[0 300 0 2]; % Intervalo de primera transformada
y=[-500 500 0 2 ]; % Intervalo de la transformada shifted
z=[0 3/100 -2 2]; % Intervalo para la señal
% Figura 3x1
% Subplot(rows, cols, index)
subplot(3,1,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de la linea) 
plot(t,x,'linewidth',2); grid; axis(z);
title('Señal x(t)');xlabel('tiempo [seg]');
subplot(3,1,2)
plot(f1,X1,'linewidth',2); grid; title('Espectro de magnitud X1(f)'); axis(v);
xlabel('frecuencia [Hz]');
subplot(3,1,3)
plot(f2,X2,'linewidth',2); grid; axis(y);
title('Espectro de magnitud X2(f)'); xlabel('frecuencia [Hz]');