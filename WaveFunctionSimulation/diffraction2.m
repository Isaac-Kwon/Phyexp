wavelength = 650e-9; %wavelength of laser (coherent wave)
slita = 0.04*10^-3; %size of slit
pxrange = 60*10^-3; %plotting range (xrange)
Y = 1.045; %distance to screen

p1 = diffractionFunctionplot2(wavelength,slita,pxrange,Y);

Ttl1 = ['Wavelength : ',num2str(wavelength*10^9),'nm','  ','Distance : ',num2str(Y*10^2),'cm'];
Ttl2 = ['SlitSize : ',num2str(slita*10^3),'mm'];
title({Ttl1;Ttl2})

p1.LineStyle = '-';

linewid = 1.25;

p1.LineWidth = linewid;

col = [0,0,0];
p1.Color= col;


ylabel('Intensity');
xlabel('Position (m)');