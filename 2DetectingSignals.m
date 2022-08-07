% Limpiando variables
clc;clear;

% dt = incremento de tiempo, n = final del intervalo
dt=0.5; % velocidad 1/T simbolos por segundo
n=0:3/dt;

% Conjunto de señales antípodas con forma de pulso de onda rectangular.
[pp,t]=rect(0,n(end),1/dt,0.5/dt);
pn=-1*pp;
pt=pn;

% Retraso = delay = 0.7
delay=0.5;

% Ruido para correlacion, SNR = 8
noise=shift(pt,round(delay/dt));
noise=awgn(noise,9,'measured');

% Correlacion para receptor
[pc,tp]=corr_n(noise,t,pp,t);

% Figura 3x1
% Subplot(rows, cols, index)
subplot(3,1,1)
% Stem = Grafica funciones Discretas (Digital) (Funciones que detecto)
stem(t*dt,pt);grid; title('Pulso transmitido');
subplot(3,1,2)
stem(t*dt,noise);grid; title('Pulso recibido');
subplot(3,1,3)
% tc find para encontrar valor entre dos valores
% ajustando parametros (talvez sea necesario
tc=find(-dt/2<tp & tp <dt/2);
stem(tp(tc:end)*dt,pc(tc:end));grid;
title('Salida del correlador con pulso de referencia (positivo)');
xlabel('tiempo [seg]');

% Comparador (siempre se usa, siempre y cuando lo indique el problema)
% No afecta a la grafica
co=find(pc==max(abs(pc)));
if pc(co) >= 0
printf('Simbolo transmitido 1\n');
else
disp('Simbolo transmitido 0');
endif