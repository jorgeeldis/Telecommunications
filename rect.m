function [x,nx]=rect(ni,nf,T,tau)
% funci�n rectangular
nx=ni:nf;
x=(nx>=(tau-T/2)&nx<=(tau+T/2));
endfunction