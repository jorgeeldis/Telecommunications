% Limpiando variables y pantallas
clear;clc;

% dt = incremento de tiempo, [ni, nf] = extremos del intervalo
dt=0.5; #dt = 0.5
ni=round(-5/dt); #ni = -10
nf=round(5/dt); #nf = 10

% funciones impuni(t – 2.5), escani(t + 1.5), rampa(t – 1) y rect((t – 1)/4)
[x1,t1]=impuni(ni,nf,round(2.5/dt));
[x2,t2]=escuni(ni,nf,round(-1.5/dt));
[x3,t3]=rampa(ni,nf,round(1/dt));
[x4,t4]=rect(ni,nf,round(4/dt),round(1/dt));

% Subplot(rows, cols, index)
subplot(4,1,1)
% Stem = Grafica funciones Discretas (Digital) (Funciones que se detectan)
stem(t1*dt,x1,'linewidth',2);grid;
ylabel('impulso');
subplot(4,1,2)
stem(t2*dt,x2,'linewidth',2);grid;
ylabel('escalon');
subplot(4,1,3)
plot(t3*dt,x3,'linewidth',2);grid;
ylabel('rampa');
subplot(4,1,4)
plot(t4*dt,x4,'linewidth',2);grid;
ylabel('rect')