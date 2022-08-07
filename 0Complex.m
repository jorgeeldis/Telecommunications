% Limpiando variables
clear; clc;

% Intervalo de tiempo
t=0:0.1:30;

% Funcion principal
x = 2*exp((-0.1+i*0.3)*t);

% Operaciones a la Funcion
M = abs(x);
F = arg(x);
R = real(x);
I = imag(x);

% Subplot(rows, cols, index)
subplot(2,2,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de linea) 
plot(t,M,'linewidth',2);grid;
title('Magnitud');
subplot(2,2,2)
plot(t,F,'linewidth',2);grid;
title('Fase');
subplot(2,2,3)
plot(t,R,'linewidth',2);grid;
title('Parte Real');
xlabel('t [seg]');
subplot(2,2,4)
plot(t,I,'linewidth',2);grid;
title('Parte Imaginaria');
xlabel('t');