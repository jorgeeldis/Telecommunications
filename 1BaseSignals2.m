% Primero usar 1BaseSignals

% Funciones con las matrices de 0 , señales cos y sen
y02=xc(1,:).*xc(2,:);
y13=xs(1,:).*xs(2,:);
y12=xc(2,:).*xs(1,:);
y23=xc(2,:).*xs(2,:);

% Subplot(rows, cols, index)
subplot(4,1,1)
% Plot(intervalo, funcion, 'linewidth', tamaño de la linea) 
plot(t,y02,'linewidth',2);grid;
title('\phi_0(t) *\phi_2(t)');
subplot(4,1,2)
plot(t,y13,'linewidth',2);grid;
title('\phi_1(t) *\phi_3(t)');
subplot(4,1,3)
plot(t,y12,'linewidth',2);grid;
title('\phi_1(t) *\phi_2(t)');
subplot(4,1,4)
plot(t,y23,'linewidth',2);grid;
title('\phi_2(t) *\phi_3(t)');
disp('integral del producto')
 
% Resultados de las integrales
y02i=sum(y02)
y13i=sum(y13)
y12i=sum(y12)
y23i=sum(y23)