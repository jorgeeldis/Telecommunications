% Limpiando variables y pantallas
clear; clc;

% Funcion 1: x(t) = (2|t|1.3 – 3|t|)/(e–4|t – 1| + 1), para |t| <= 2 s
t = -2:0.1:2;
x=(2*abs(t).^1.3-3*abs(t))./(exp(-4*abs(t-1))+1);

% Funcion 2: x(0.7), find para buscar el valor 0.7
tb=find(t>0.65 & t<0.75);
xb= x(tb);

% Funcion 3: x(-t) - la funcion fliplr es para darle vuelta a la funcion
tc=-fliplr(t);
xc=fliplr(x);

% Funcion 4: (0.5t)
xd=(2*abs(0.5*t).^1.3-3*abs(0.5*t))./(exp(-4*abs(0.5*t-1))+1);

% Funcion 5: x(–2t – 1)
xe=(2*abs(-2*t-1).^1.3-3*abs(-2*t-1))./(exp(-4*abs(-2*t-1-1))+1);

% Funcion 6: 0.5[x(t)*x(0.5t)] se usa convolucion
[xf tf]=conv_n(x,t,xd,t);
xf=0.5*xf;
m=min([min([x;xc;xd]),min(xf)]); M=max([max([x;xc;xd]),max(xf)]);
v=[-2 2 m M];

% Subplot(rows, cols, index)
subplot(3,2,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de la linea) 
plot(t,x,'linewidth',2);grid;axis(v); ylabel('x(t)');
subplot(3,2,2)
plot(t(tb),xb,'linewidth',3);grid;axis(v); ylabel('x(0.7)');
subplot(3,2,3)
plot(tc,xc,'linewidth',2);grid;axis(v); ylabel('x(-t)');
subplot(3,2,4)
plot(t,xd,'linewidth',2);grid;axis(v); ylabel('x(0.5t)');
subplot(3,2,5)
plot(t,xe,'linewidth',2);grid;axis(v); ylabel('x(-2t-1)');
xlabel('tiempo [seg]');
subplot(3,2,6)
plot(tf,xf,'linewidth',2);grid;axis(v); ylabel('0.5[x(t)*x(0.5t)]');
xlabel('tiempo [seg]');