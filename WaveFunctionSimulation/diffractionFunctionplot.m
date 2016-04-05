function [] = diffractionFunctionplot(wavelength, slitx)

%clc
%clearvars -except wavelength slitx vali valj

EucD = @(r1,r2) sqrt( sum ( (r1 - r2).^2) );

% wavelength = 2
% slitx = 5
divide = 50;  %set the Resolution of graph
slitdivide = 70; %set the Resolution of Numerical Integration

A = 1;
k = 2*pi/wavelength;
w = 1;
t = 0;

wavefunc = @(r) A*sin(k*r - w*t);

wavefunc2 = @(r1,r2) wavefunc(EucD(r1,r2))/(EucD(r1,r2))^(1/2);

xrange = [0,20];
yrange = [0,20];

xrange = linspace(xrange(1),xrange(2),divide);
yrange = linspace(yrange(1),yrange(2),divide);

%slitx = 8


slit = [mean(xrange)-(slitx/2), mean(xrange)+(slitx/2)];

integraldivide = slitx*slitdivide; %slit divide

A = A/slitx;

clear divide

[Xrange, Yrange] = meshgrid(xrange,yrange);

values = [];

i = 1;

for xval = xrange
    
    j = 1;
    
    for yval = yrange
        
        r1 = [xval yval];
        
        vals = [];
        
        for intval = linspace(slit(1),slit(2),integraldivide)
            
            r2 = [intval,0];
            vals = [vals (wavefunc2(r1, r2)/integraldivide)];
            
        end
        
        values(j,i) = sum(vals);
        
        
        j=j+1;
        
    end
    i=i+1;
end

%close all

surf( Xrange,Yrange,values)

shading interp
view(0,90)

pt1 = ['Wavelength : ', num2str(wavelength)];
pt2 = ['Slit Size : ',  num2str(slitx)];
title({pt1; pt2});


