% Limpiando variables y pantallas
clear;clc;

% T = Periodo, t = intervalo, s = se�al de tono
% h = se�al de filtro con respuesta al impulso, x = se�al de entrada
T=5e-3; % Va siempre, hasta que se diga lo contrario
t=0:T/100:5*T; % Va siempre, hasta que se diga lo contrario
s=sin(400*pi*t);
h=200*exp(-100*t).*cos(400*pi*t);
x=cos(100*pi*t)+sin(400*pi*t);

% Funcion de convolucion (se�al de salida del filtro)
[y,ty]=conv_n(x,t,h,t);

% Figura 4x1
% Subplot(rows, cols, index)
subplot(4,1,1)
% Plot(intervalo, funcion, 'linewidth', tama�o de la linea) 
plot(t,h,'linewidth',2);grid;
title('Respuesta al impulso del filtro');
subplot(4,1,2)
plot(t,s,'linewidth',2);grid;
title('Se�al transmitida');
subplot(4,1,3)
plot(t,x,'linewidth',2);grid;
title('Se�al recibida');
subplot(4,1,4)
% 1:length(t) es para poner los valores de las graficas igual a las pasadas
plot(ty(1:length(t)),y(1:length(t)),'linewidth',2);grid;
title('Se�al de salida');