function [x,nx]=impuni(ni,nf,tau)
% funci�n impulso unitario
nx=ni:nf;
x=nx==tau;
endfunction