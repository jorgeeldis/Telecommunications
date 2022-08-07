% Limpiando variables
clear;
clc;

% T = Periodo, t = intervalo, dt = intervalo de periodo, df = intervalo de frecuencia
% N = número de puntos de la señal, Fs = frecuencia de muestreo
T=5e-3;
dt=T/100;
df=1/T;
t=0:dt:5*T-dt;
N=length(t);
Fs=N*df;

% s = señal de tono
% h = señal de filtro con respuesta al impulso, x = señal de entrada
s=sin(400*pi*t);
h=200*exp(-100*t).*cos(400*pi*t);
x=cos(100*pi*t)+sin(400*pi*t)-cos(800*pi*t);

% Funcion de convolucion (señal de salida del filtro)
[y,ty]=conv_n(x,t,h,t);

% Señal de salida del filtro (se hace para tener mejor soporte)
y=y(1:length(t));
N=length(t);
res=10;

% Determinando el espectro de magnitud de señales entrada, salida y magnitud de respuesta
% en filtro
H=fft(h,N*res)/N; H=2*abs(H(1:N*res/2));
H=H/max(H); % Se hizo porque el soporte no estaba normalizado
S=fft(s,N*res)/N; S=2*abs(S(1:N*res/2));
S=S/max(S); % Se hizo porque el soporte no estaba normalizado
X=fft(x,N*res)/N; X=2*abs(X(1:N*res/2));
X=X/max(X); % Se hizo porque el soporte no estaba normalizado
Y=fft(y,N*res)/N; Y=2*abs(Y(1:N*res/2));
Y=Y/max(Y); % Se hizo porque el soporte no estaba normalizado
df=df/res;
f=linspace(0,Fs/res,length(H));

% Axis de los espectros (ir cambiando dependiendo de la grafica)
v=[0 800 0 1]; 
% Figura 4x2
% Subplot(rows, cols, index)
subplot(4,2,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de la linea) 
plot(t,h,'linewidth',2);grid;
title('Respuesta al impulso del filtro');
subplot(4,2,3)
plot(t,s,'linewidth',2);grid;
title('Señal transmitida');
subplot(4,2,5)
plot(t,x,'linewidth',2);grid;
title('Señal recibida');
subplot(4,2,7)
plot(ty(1:length(t)),y(1:length(t)),'linewidth',2);grid;
title('Señal de salida');
subplot(4,2,2)
plot(f,H,'linewidth',2);grid;axis(v);
title('H(f)');
subplot(4,2,4)
plot(f,S,'linewidth',2);grid;axis(v);
title('H(s)');
subplot(4,2,6)
plot(f,X,'linewidth',2);grid;axis(v);
title('|X(f)|');
subplot(4,2,8)
plot(f,Y,'linewidth',2);grid;axis(v);
title('|Y(f)|');