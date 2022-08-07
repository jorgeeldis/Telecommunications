function [x,nx]=impuni(ni,nf,tau)
% función impulso unitario
nx=ni:nf;
x=nx==tau;
endfunction