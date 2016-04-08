function [] = DdiffractionFunctionplot(wavelength, slitx, slitg)

%clc
%clearvars -except wavelength slitx vali valj

% wavelength = 3
% slitx = 2
% slitg = 4

EucD = @(r1,r2) sqrt( sum ( (r1 - r2).^2) );

divide = 200;  %set the Resolution of graph
slitdivide = 40; %set the Resolution of Numerical Integration

A = 1;
k = 2*pi/wavelength;
w = 1;
t = 0;


integraldivide = slitx*slitdivide; %slit divide

wavefunc = @(r) A*sin(k*r - w*t)./sqrt(r);
EucDM = @(r1x, r1y, r2x, r2y) sqrt( (r1x - r2x).^2 + (r1y - r2y).^2 ) ;

xrange = [0,20];
yrange = [0,20];

xrange = linspace(xrange(1),xrange(2),divide);
yrange = linspace(yrange(1),yrange(2),divide);

slit = cell(1,2);

slit{1} = [mean(xrange)-slitg/2-slitx, mean(xrange)-slitg/2];
slit{2} = [mean(xrange)+slitg/2, mean(xrange)+slitg/2+slitx];

slitrange{1} = linspace(slit{1}(1), slit{1}(2), integraldivide);
slitrange{2} = linspace(slit{2}(1), slit{2}(2), integraldivide);

A = A/slitx;

clear divide

[Xrange, Yrange] = meshgrid(xrange,yrange);

values = cell(1,2);


for j = 1:size(values,2)

    for i = 1:integraldivide

        values{j} (:,:,i) = wavefunc( EucDM(Xrange, Yrange, slitrange{j}(i),0 ) );

    end

    values{j} = sum(values{j},3);

end


values2 = (values{1} + values{2})/integraldivide;

%close all

surf( Xrange,Yrange,values2)

shading interp
view(0,90)

pt1 = ['Wavelength : ', num2str(wavelength)];
pt2 = ['Slit Size : ',  num2str(slitx) ' Gap : ' num2str(slitg)];
title({pt1; pt2});

end



