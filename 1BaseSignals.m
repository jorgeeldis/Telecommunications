% Clear the screen and variables
clear;clc;

% Intervalos de la grafica, porque se usa zeros
t = 0:0.05:4;

% Creacion de matrices llenas de 0
xc=zeros(4,length(t));
xs=zeros(3,length(t));

% for = rango de la funcion
for i=0:3
xc(i+1,:)=cos(0.5*pi*i*t);
end

% for = rango de la funcion
for i=1:3
xs(i,:)=sin(0.5*pi*i*t);
end

% Subplot(rows, cols, index)
subplot(2,1,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de la linea) 
plot(t,xc,'linewidth',2);grid;
ylabel('Funciones cos');
subplot(2,1,2)
plot(t,xs,'linewidth',2);grid;
ylabel('Funciones sin');