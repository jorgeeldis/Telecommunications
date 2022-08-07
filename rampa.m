function [x,nx]=rampa(ni,nf,tau)
% función rampa unitaria
nx=ni:nf;
x=nx-tau;
endfunction