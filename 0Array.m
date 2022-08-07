% Hacer un array con valor inicial, y final e incremento.
si=input('Valor inicial ');
sf=input('Valor final ');
d= input('Incremento ');
s=si:d:sf

# t1 = 0, 1, ..., 15
t1 = 0:1:15;

# t2 = 0, 0.5, 1, 1.5, ..., 10
t2 = 0:0.5:10;

# t3 = 15, 13, 11, ..., -15
t3 = 15:-2:-15

# t4 con mil valores entre 0 y 50 distribuidos linealmente
t4 = linspace(0,50,1000)

# t5 con cien valores entre 0.001 y 10000 distribuidos en forma logarítmica.
t5 = logspace(-3,4,100)