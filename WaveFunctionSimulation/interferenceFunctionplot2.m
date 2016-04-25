

function [] = interferenceFunctionplot2(wavelength, slita, slitd, pxrange, Y)

% wavelength = 650*10^(-9);

% slita = (0.04*10^(-3));

% slitd = (0.5)*10^(-3)/2;
% pxrange = [-100,100]*10^(-3);
% Y = 1.045;

slit = slita*[-1 1]/2;
pxrange = [-1 1]*pxrange;
divide = 1024;
integraldivide = 128;


A = diffractionFunction2(wavelength, slit-slitd, Y, pxrange, divide);
B = diffractionFunction2(wavelength, slit+slitd, Y, pxrange, divide);
values = A+B;

values = abs((sum(values,2)/integraldivide));

values = (sum(values,3)).^2;

xrange = [-10,10]*10^(-3);

xrange = linspace(xrange(1),xrange(2),divide);

plot( xrange ,values)

%pt1 = ['Wavelength : ', num2str(wavelength),'    Slit Size : ',  num2str(sum(abs(slit)))];
%pt2 = ['RangeDivide: ', num2str(divide),'     SlitDivide : ',num2str(slitdivide),'     AngleDivide : ',num2str(angledivide)];
%title({pt1; pt2});

end

