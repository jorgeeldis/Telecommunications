function[z,tz] = corr_n(x,tx,y,ty)
dt=tx(2)-tx(1);
ty=-fliplr(ty);
y=fliplr(y);
tzi=tx(1)+ty(1);
tzf=tx(length(tx))+ty(length(ty));
z=dt*conv(x,y);
tz=linspace(tzi,tzf,length(z));
endfunction