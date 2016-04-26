wavelength = 650e-9; %wavelength of laser (coherent wave)
slita = 0.04*10^-3; %size of slit
slitd = 0.5*10^-3; %gap of slit
pxrange = 7*10^-3; %plotting range (xrange)
Y = 1.045; %distance to screen
close all

hold on

p1 = interferenceFunctionplot2(wavelength, slita, slitd, pxrange, Y);
p2 = interferenceFunctionplot2(wavelength, slita, slitd/2, pxrange, Y);
p3 = interferenceFunctionplot2(wavelength, slita, slitd/4, pxrange, Y);


Ttl1 = ['Wavelength : ',num2str(wavelength*10^9),'nm','  ','Distance : ',num2str(Y*10^2),'cm'];
Ttl2 = ['SlitSize : ',num2str(slita*10^3),'mm'];
title({Ttl1;Ttl2})

p2.LineStyle = '--';
p3.LineStyle = '-.';

hold off
legend('d = 0.5 mm','d = 0.25 mm','d = 0.125 mm');
ylabel('Intensity');
xlabel('Position (m)');



%legend([p1,p2,p3], '1','*2','/2')