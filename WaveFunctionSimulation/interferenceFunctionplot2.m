

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

function values = diffractionFunction2(wavelength, slit, Y, xrange, divide)

%clc
%clearvars -except wavelength slitx vali valj

% wavelength = 2
% slitx = 5

%divide = 512;  %set the Resolution of graph
integraldivide = 128;%10^11; %set the Resolution of Numerical Integration
angledivide = 64;

A = 1;
k = 2*pi/wavelength;

wavefunc = @(r,t) A*cos(k*r+t)./r;
EucDM = @(r1x, r1y, r2x, r2y) sqrt( (r1x - r2x).^2 + (r1y - r2y).^2 ) ;


%xrange = [-5,5];

xrange = linspace(xrange(1),xrange(2),divide);



%slit = [mean(xrange)-(slitx/2), mean(xrange)+(slitx/2)];
slitrange = linspace(slit(1), slit(2), integraldivide);



angle = linspace(0,2*pi,angledivide);

%values = [];%zeros([size(xrange,2) size(slitrange,2) size(angle,2)]);

[Xrange, S, Ag] = ndgrid(xrange,  slitrange, angle);

clearvars -except wavefunc EucDM Xrange xrange Y S Ag wavelength slitx divide slitdivide angledivide integraldivide

values = wavefunc( EucDM(Xrange, Y, S ,0) , Ag)/angledivide;

% figure
% 
% surf(values)
% 
% shading interp
% 
% view(-90,90)

% values = abs((sum(values,2)/integraldivide));
% 
% values = (sum(values,3)).^2;

% plot( xrange ,values)
% 
% 
% 
% 
% pt1 = ['Wavelength : ', num2str(wavelength),'    Slit Size : ',  num2str(slitx)];
% pt2 = ['RangeDivide: ', num2str(divide),'     SlitDivide : ',num2str(slitdivide),'     AngleDivide : ',num2str(angledivide)];
% title({pt1; pt2});

end