wavelength = 650e-9; %wavelength of laser (coherent wave)
slita = 0.04*10^-3; %size of slit
slitd = 0.25*10^-3; %gap of slit
pxrange = 60*10^-3; %plotting range (xrange)
Y = 1.045; %distance to screen

p1 = interferenceFunctionplot2(wavelength, slita, slitd, pxrange, Y);

p1.LineStyle = '-';

linewid = 1.2;

p1.LineWidth = linewid;

col = [0,0,0];
p1.Color= col;

ylabel('Intensity');
xlabel('Position (m)');

Ttl1 = ['Wavelength : ',num2str(wavelength*10^9),'nm','  ','Distance : ',num2str(Y*10^2),'cm'];
Ttl2 = ['SlitSize : ',num2str(slita*10^3),'mm','  ','SlitGap : ',num2str(slitd*10^3),'mm'];
title({Ttl1;Ttl2})