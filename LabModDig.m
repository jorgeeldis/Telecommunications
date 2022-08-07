% Conceptos b�sicos de modulaci�n pasa-banda
% BASK - BPSK - M-ASK - BFSK
% Se requieren los pkg signal, communications, control
% Carlos A. Medina C. 2021
pkg load signal
pkg load control
pkg load communications
clc; clear;
up = 100;   % factor de sobremuestreo
N = 15;     % longitud de los datos
dt= 1/up;   % intervalo de muestras
T = 1;      % duraci�n de s�mbolo
fc = 2;     % frecuencia de la portadora

fprintf('Esquemas b�sicos de modulaci�n digital \n\n');
fprintf('Escoja el tipo de modulaci�n digital de inter�s \n');
fprintf('BPSK (1) BASK (2) M-ASK (3) BFSK (4)\n\n');
% Modulaciones BPSK, BASK, M-ASK
A = input ("Tipo de modulaci�n = ");
if A == 3
  M= input ("N�mero de niveles para M-ASK = ");
end

switch (A)
  case (1)
    d = randint(1,N)*2-1;  % Datos binarios polar (+1,-1) BPSK
    case (2)
    d = randint(1,N);      % Datos binarios (0,+1) BASK
    case (3)
    d = randint(1,N,M);    % Datos binarios polar (0,+1,...,M-1) M-ASK
    otherwise
    d = randint(1,N)*2-1;  % Datos binarios polar (+1,-1) BFSK
endswitch

k=[0 N-1];              % Soporte de d, Intantes de muestras kT, k = 0 1 ... N-1
de =repelem(d,up);      % pulsos rectangulares
tde=k(1):dt:k(2)+1-dt;  % Soporte de impulsos
ni= find(tde == 0);
nf= find(tde == k(2));
de=de(ni:nf);           % datos de inter�s en instantes k
tde=tde(ni:nf);         % soporte de datos de inter�s
di=upsample(d,up);      % S�mbolos (datos)
di=di(1:length(tde));

switch (A)
  case (1)
    pc=cos(2*pi*fc*tde);     % portadora
    drx=de.*pc;              % se�al modulada
    case (2)
    pc=cos(2*pi*fc*tde);     % portadora 
    drx=de.*pc;              % se�al modulada
    case (3)
    pc=cos(2*pi*fc*tde);     % portadora 
    drx=de.*pc;              % se�al modulada
   otherwise
    pc=cos(2*pi*(fc+1+de).*tde); % portadoras fc = [2 y 4] Hz
    drx=pc;              % se�al modulada
endswitch


v=[min(tde) max(tde) min(drx)-0.5 max(drx)+0.5];
subplot(3,2,1);
stem(tde,di,'linewidth',2);axis(v);grid;title('S�mbolos Tx');
subplot(3,2,3);
plot(tde,de,'linewidth',2,tde,drx,'linewidth',3);axis(v);grid

switch (A)
  case (1)
    title('Se�al BPSK');
    case (2)
    title('Se�al BASK');
    case (3)
    title('Se�al M-ASK');
    otherwise
    title('Se�al BFSK');
endswitch

env=abs(hilbert(drx));    % envolvente
subplot(3,2,4);
plot(tde,env,'linewidth',2);axis(v);grid
title('Envolvente de la se�al modulada');

%Demodulaci�n
switch (A)
  case (1)                % demodulaci�n coherente
    dm=drx.*pc;               
      for r = 0:N-2 
        dr(r+1)=mean(dm(r*up+1:up*(r+1)));
      end 
    case (2)              % detecci�n de envolvente
    for r = 0:N-2 
        dr(r+1)=mean(env(r*up+1:up*(r+1)));
      end  
    case (3)              % detecci�n de envolvente
    for r = 0:N-2 
        dr(r+1)=mean(env(r*up+1:up*(r+1)));
      end  
    otherwise             % demodulaci�n no-coherente
    dm=drx.*cos(2*pi*4*tde); % Usar fc correspondiente al s�mbolo 1          
      for r = 0:N-2 
        dr(r+1)=sum(dm(r*up+1:up*(r+1)));
      end 
endswitch

subplot(3,2,5);
stem([0:length(dr)-1],dr,'linewidth',2);axis(v);grid
title('S�mbolos recuperados');
