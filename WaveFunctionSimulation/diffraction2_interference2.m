wavelength = 650e-9; %wavelength of laser (coherent wave)
slita = 0.04*10^-3; %size of slit
slitd = 0.25*10^-3; %gap of slit
pxrange = 38*10^-3; %plotting range (xrange)
Y = 1.045; %distance to screen

figure
hold on

p1 = interferenceFunctionplot2(wavelength, slita, slitd, pxrange, Y);
p2 = diffractionFunctionplot2(wavelength,slita,pxrange,Y);

hold off

p2.YData = (p2.YData)*(max(p1.YData)/max(p2.YData));


Ttl1 = ['Wavelength : ',num2str(wavelength*10^9),'nm','  ','Distance : ',num2str(Y*10^2),'cm'];
Ttl2 = ['SlitSize : ',num2str(slita*10^3),'mm','  ','SlitGap : ',num2str(slitd*1000),'mm'];
title({Ttl1;Ttl2})

p2.LineStyle = '--';

legend('Double Slit','Single Slit')

%legend([p1,p2,p3], '1','*2','/2')