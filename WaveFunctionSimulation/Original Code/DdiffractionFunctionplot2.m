function [] = DdiffractionFunctionplot2(wavelength, slitx, slitg)

%clc
%clearvars -except wavelength slitx vali valj

% wavelength = 3
% slitx = 2
% slitg = 4

EucD = @(r1,r2) sqrt( sum ( (r1 - r2).^2) );

divide = 100;  %set the Resolution of graph
slitdivide = 40; %set the Resolution of Numerical Integration

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

slit = cell(1,2);

slit{1} = [mean(xrange)-slitg/2-slitx, mean(xrange)-slitg/2];
slit{2} = [mean(xrange)+slitg/2, mean(xrange)+slitg/2+slitx];

integraldivide = slitx*slitdivide; %slit divide

A = A/slitx;

clear divide

[Xrange, Yrange] = meshgrid(xrange,yrange);

values = cell(1,2);


for k = 1:2
    i=1;
    for xval = xrange

        j = 1;

        for yval = yrange

            r1 = [xval yval];

            vals = [];

            for intval = linspace(slit{k}(1),slit{k}(2),integraldivide)

                r2 = [intval,0];
                vals = [vals (wavefunc2(r1, r2)/integraldivide)];

            end

            values{k}(j,i) = sum(vals);


            j=j+1;

        end
        i=i+1;
    end
    
end


values2 = values{1} + values{2};

%close all

surf( Xrange,Yrange,values2)

shading interp
view(0,90)

pt1 = ['Wavelength : ', num2str(wavelength)];
pt2 = ['Slit Size : ',  num2str(slitx) ' Gap : ' num2str(slitg)];
title({pt1; pt2});

end



