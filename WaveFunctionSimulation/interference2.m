wavelength = 560e-9; %wavelength of laser (coherent wave)
slita = 0.04*10^-3; %size of slit
slitd = 0.25*10^-3; %gap of slit
pxrange = 38*10^-3; %plotting range (xrange)
Y = 1.405; %distance to screen

figure

hold on

p1 = interferenceFunctionplot2(wavelength, slita, slitd, pxrange, Y);

p2 = interferenceFunctionplot2(wavelength, slita, slitd*2, pxrange, Y);

p3 = interferenceFunctionplot2(wavelength, slita, slitd/2, pxrange, Y);


hold off

legend([p1,p2,p3], '1','*2','/2')