wavelength = 650e-9; %wavelength of laser (coherent wave)
slita = 0.16*10^-3; %size of slit
pxrange = 30*10^-3; %plotting range (xrange)
Y = 1.045; %distance to screen

figure
hold on

p1 = diffractionFunctionplot2(wavelength,slita,pxrange,Y);
p2 = diffractionFunctionplot2(wavelength,slita,pxrange,Y);
p3 = diffractionFunctionplot2(wavelength,slita,pxrange,Y);

hold off


Ttl1 = ['Wavelength : ',num2str(wavelength*10^9),'nm','  ','Distance : ',num2str(Y*10^2),'cm'];
title({Ttl1})

p2.LineStyle = '--';
p3.LineStyle = '-.';

legend('a = 0.16 mm','a = 0.08 mm','a = 0.04 mm');
ylabel('Intensity');
xlabel('Position (m)');

%legend([p1,p2,p3], '1','*2','/2')