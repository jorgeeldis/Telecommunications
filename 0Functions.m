% Limpiando las variables
clear; clc;

% T = periodo, t = intervalo del tiempo, (frecuencia = 1/T)
T=1/100;
t=0:T/50:2*T;

% x1, x2 = funciones
x1 = 5*sin(2*pi*1/T*t);
x2 = 5*cos(2*pi*2/T*t);

% Funcion de la derivada
function[xd,td]=deriv(x,t)
  xd=diff(x)./diff(t);
  td=t(2:end);
endfunction

% Derivando las funciones con respecto al tiempo
[y1,t1]=deriv(x1,t);
[y2,t2]=deriv(x2,t);

% Subplot(rows, cols, index)
subplot(3,1,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de la linea) 
plot(t,x1,t,x2,'linewidth',2);grid;
title('Funciones y sus derivadas');
legend('x_1(t)','x_2(t)');
subplot(3,1,2)
plot(t,x1,t1,y1,'linewidth',2);grid;
legend('x_1(t)','y_1(t)');
subplot(3,1,3)
plot(t,x2,t2,y2,'linewidth',2);grid;
legend('x_2(t)','y_2(t)');
xlabel('t[seg]');