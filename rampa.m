function [x,nx]=rampa(ni,nf,tau)
% funci�n rampa unitaria
nx=ni:nf;
x=nx-tau;
endfunction