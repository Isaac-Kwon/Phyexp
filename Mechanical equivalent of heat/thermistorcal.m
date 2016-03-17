resistor = input('Resistor Value : ');

fiii = @(x) fitp(x)*1000 - resistor;

fzero(fiii,0)