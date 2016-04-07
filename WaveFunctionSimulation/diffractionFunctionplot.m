function [] = diffractionFunctionplot(wavelength, slitx)

%clc
%clearvars -except wavelength slitx vali valj

% wavelength = 2
% slitx = 5

divide = 100;  %set the Resolution of graph
slitdivide = 100; %set the Resolution of Numerical Integration

A = 1;
k = 2*pi/wavelength;
w = 1;
t = 0;

wavefunc = @(r) A*sin(k*r - w*t)./sqrt(r);
EucDM = @(r1x, r1y, r2x, r2y) sqrt( (r1x - r2x).^2 + (r1y - r2y).^2 ) ;


xrange = [0,20];
yrange = [0,20];

xrange = linspace(xrange(1),xrange(2),divide);
yrange = linspace(yrange(1),yrange(2),divide);

%slitx = 8

integraldivide = slitx*slitdivide; %slit divide

slit = [mean(xrange)-(slitx/2), mean(xrange)+(slitx/2)];
slitrange = linspace(slit(1), slit(2), integraldivide);

A = A/slitx;

[Xrange, Yrange] = meshgrid(xrange,yrange);

values = [];

for i = 1:integraldivide
    
    values(:,:,i) = wavefunc( EucDM(Xrange, Yrange, slitrange(i),0 ) );
    
    
end


values = sum(values,3)/integraldivide;

surf( Xrange,Yrange,values)

shading interp
view(0,90)

pt1 = ['Wavelength : ', num2str(wavelength)];
pt2 = ['Slit Size : ',  num2str(slitx)];
title({pt1; pt2});

end
