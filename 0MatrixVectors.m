# Limpiando todas las variables
clear;
clc;

# Asignando valor a las variables
a = 5;
b = 7;
c = 9;

# Generando matriz identidad 3x3 (filasxcolumnas)
B = eye(3);

# Generando un vector 1x3 (filasxcolumnas)
d = [10, 15, 20];

# Generando una matriz 2x3 (filasxcolumnas)
A = [1, 3, 5 ; 2, 4, 6];

# A partir de las variables, generando matriz 4x1 (filasxcolumnas)
e1 = [A(:,1);A(:,2)]; # de la A, agarrar toda la 1ra columna y la 2da columna, y pasarla a una columna

# A partir de las variables, generando matriz 1x3 (filasxcolumnas)
e2=[a b c-1];

# A partir de las variables, generando matriz 1x3 (filasxcolumnas)
e3=A(2,:); # de la A, agarrar toda la 2da fila 

# A partir de las variables, generando matriz 3x3 (filasxcolumnas)
e4=[A;B(3,:)] # de la A, agarrar toda matriz y de la B, agarrar la ultima fila