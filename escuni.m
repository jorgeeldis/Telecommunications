# Como se crea una funcion en octave

function [x,nx]=escuni(ni,nf,tau)
% funci�n escalon unitario
nx=ni:nf; # nx = inicio : final
x=nx>=tau;
endfunction