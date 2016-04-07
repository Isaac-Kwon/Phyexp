
Gwavelength = [2 4 8];
Gslitg = [2 4 10];
Gslitx = 2;

close all
figure

Gvali = 1:size(Gslitg,2);
Gvalj = 1:size(Gwavelength,2);
k=1;
for vali = Gvali
   
    for valj = Gvalj
        
        subplot(size(Gslitg,2),size(Gwavelength,2),k)
       
        fprintf('Evaluate %d %d \n', vali, valj)
        DdiffractionFunctionplot(Gwavelength(valj), Gslitx, Gslitg(vali))
        shading interp
        
        k=k+1;
    end
     
end