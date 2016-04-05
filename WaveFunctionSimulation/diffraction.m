Gwavelength = [2 4 8];
Gslitx = [2 4 8];

close all
figure

for vali = 1:3
   
    for valj = 1:3
        
        subplot(3,3,(vali-1)*3+valj)
        fprintf('Evaluate %d %d \n', vali, valj)
        diffractionFunctionplot(Gwavelength(vali),Gslitx(valj))
        
    end
     
end