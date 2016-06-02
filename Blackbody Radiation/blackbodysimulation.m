close all


h = 6.62607004*10^(-34);
k = 1.3806504*10^(-23);
c = 299792458;

intensity2 = @(wl,T) ( (2 * pi * h * c^2 ) ./ (wl.^5) ) .* (1./(exp((h*c)./(wl*k.*T))));

wavemin = 0;
wavemax = 6000*10^(-9);
wavedi = 400;

wavelength = linspace(wavemin,wavemax,wavedi);
datat = linspace(0,8000,400);

[W,T] = meshgrid(wavelength,datat);

z = intensity2(W,T);

z1 = z;

z=z.^2;
figure
for i= 1:size(z,1)
    z(i,:) = z(i,:)/max(z(i,:));
    
    
end
p1 = surf(T,W,z);
view(0,90); 
shading interp
xlabel('Temperature (K)')
ylabel('Wavelength (m)')



z2 = z;
z2 = (z2>0.5)*1;

figure;
surf(T,W,z2);
view(0,90)
shading interp


title('Overhalfmax Wavelength');
xlabel('Temperature (K)')
k={'Wavelength (m)';'(Over Half of max)'};
ylabel(k)

figure
p1 = plot(datat,(sum(z2,2)/wavedi)*(wavemax-wavemin));
xlabel('Temperature (K)')
ylabel('FWHM (distribution) (m)')
set(p1,'LineWidth',1.2)
set(p1,'Color',[0,0,0])

figure
surf(T,W,z1);
xlabel('Temperature (K)')
ylabel('Wavelength (m)')
shading faceted


