function [promedio] = mean_n(A)
sumadearreglo = sum(A);
[numcols, numrows] = size(A);
promedio = sumadearreglo / numrows
endfunction