dt=0.05; 
n=0:2/dt;
[pp,t]=rect(0,n(end),1/dt,0.05/dt);
pn=-1*pp;
pt=pn;
delay=0.5;
pr=shift(pt,round(delay/dt));
pr=awgn(pr,9,'measured'); 
[pc,tp]=corr_n(pr,t,pp,t); 
prr=awgn(pr,6,'measured');
retr=0.9;

subplot(3,2,1)
stem(t*dt,pt);grid; title('Pulso transmitido');
subplot(3,2,3)
stem(t*dt,pr);grid; title('Pulso recibido');
subplot(3,2,5)
tc=find(-dt/2<tp & tp <dt/2);
stem(tp(tc:end)*dt,pc(tc:end));grid;
title('Salida del correlador con pulso de referencia (positivo)');
xlabel('tiempo [seg]');

subplot(3,2,2)
stem(t*dt,pt);grid; title('Pulso transmitido');
subplot(3,2,4)
stem(t*dt,prr);grid; title('Pulso recibido');
subplot(3,2,6)
tc=find(-dt/2<tp & tp <dt/2);
stem(tp(tc:end)*dt,pc(tc:end));grid;
