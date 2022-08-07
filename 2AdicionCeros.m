% Limpiando variables
clear;
clc;

N=1000; % Número de puntos de la señal (longitud en el tiempo)
Fs=1000; % Frecuencia de Muestreo 1kHz
dt=1/Fs; % Periodo de Muestreo
T=N*dt; % Tiempo total de la señall
t=(0:N-1)*dt; % Intervalo de la señal en tiempo
df=1/T; % Resolucion de frecuencia

x=sin(2*pi*100*t)+2*sin(2*pi*202.5*t); % Señal
X=fft(x)/N; % Transformada Discreta de Fourier
X1=2*abs(X(1:length(X)/2)); % Espectro de Amplitud de un Solo Lado
f1=0:df:Fs/2-df; % Intervalo en frecuencia

Xz=fft(x,2000)/length(x); % Transformada Discreta de Fourier con Longitud de 2000 puntos
X1z=2*abs(Xz(1:length(Xz)/2)); % Espectro de Amplitud de un Solo Lado
dfz=Fs/length(Xz); % Resolucion de frecuencia 
fz=0:dfz:Fs/2-dfz; % Intervalo en frecuencia

v=[0 300 0 2]; % Intervalo de primera transformada
z=[0 3/100 -3 3]; % Intervalo de segunda transformada
% Figura 3x1
% Subplot(rows, cols, index)
subplot(3,1,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de la linea) 
plot(t,x,'linewidth',2);grid;axis(z);
subplot(3,1,2)
plot(f1,X1,'linewidth',2);grid;axis(v);
subplot(3,1,3)
plot(fz,X1z,'linewidth',2);grid;axis(v);