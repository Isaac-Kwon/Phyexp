wavelength = 560e-9; %wavelength of laser (coherent wave)
slita = 0.04*10^-3; %size of slit
slitd = 0.25*10^-3; %gap of slit
pxrange = 38*10^-3; %plotting range (xrange)
Y = 1.405; %distance to screen


hold on

p1 = interferenceFunctionplot2(wavelength, slita, slitd, pxrange, Y);

hold off

%legend([p1,p2,p3], '1','*2','/2')
xlabel('Position (mm)');
ylabel('Intensity');