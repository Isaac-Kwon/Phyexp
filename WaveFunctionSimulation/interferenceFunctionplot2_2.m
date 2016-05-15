

function P1 = interferenceFunctionplot2_2(wavelength, slita, slitd, pxrange, Y)

% wavelength = 650*10^(-9);

% slita = (0.04*10^(-3));

% slitd = (0.5)*10^(-3)/2;
% pxrange = [-100,100]*10^(-3);
% Y = 1.045;

slit = slita*[-1 1]/2;
pxrange = [-1 1]*pxrange;
divide = 2048;
integraldivide = 128;


A = diffractionFunction2(wavelength, slit-slitd/2, Y, pxrange, divide,0);
B = diffractionFunction2(wavelength, slit+slitd/2, Y, pxrange, divide,pi/2);
values = A+B;

values = abs((sum(values,2)/integraldivide));

values = (sum(values,3)).^2;

%pxrange = [-10,10]*10^(-3);

pxrange = linspace(pxrange(1),pxrange(2),divide);

P1 = plot( pxrange ,values);

pt1 = ['Wavelength : ', num2str(wavelength*10^9),'nm'];
pt2 = ['    Slit Size : ',  num2str(slita*1000), 'mm' ,'    Slit Gap : ', num2str(slitd*1000), 'mm' ];
title({pt1;pt2});
xlabel('Position (mm)');
ylabel('Intensity');

end

function values = diffractionFunction2(wavelength, slit, Y, xrange, divide,phi)

%divide = 512;  %set the Resolution of graph
integraldivide = 128;%10^11; %set the Resolution of Numerical Integration
angledivide = 256;

A = 1;
k = 2*pi/wavelength;

wavefunc = @(r,t) A*cos(k*r+t+phi)./r;
EucDM = @(r1x, r1y, r2x, r2y) sqrt( (r1x - r2x).^2 + (r1y - r2y).^2 ) ;

xrange = linspace(xrange(1),xrange(2),divide);
slitrange = linspace(slit(1), slit(2), integraldivide);



angle = linspace(0,2*pi,angledivide);


[Xrange, S, Ag] = ndgrid(xrange,  slitrange, angle);

values = wavefunc( EucDM(Xrange, Y, S ,0) , Ag)/angledivide;

end
