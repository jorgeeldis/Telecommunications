function[z,tz] = conv_n(x,tx,y,ty)
dt=tx(2)-tx(1);
tzi=tx(1)+ty(1);
tzf=tx(length(tx))+ty(length(ty));
z=dt*conv(x,y);
tz=linspace(tzi,tzf,length(z));
endfunction