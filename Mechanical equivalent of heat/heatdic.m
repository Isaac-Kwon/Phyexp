clc
clear

M = 4.032
g = 9.81
r = 0.023875
w = 2*pi*10/((3.8+6.8)/2)
c = 0.92048
m = 203

h = 43.47
ha = 50*(10^6)

Aa = 2*pi*r*h

R = 0.00895

A = M*g*r*w
P = 0.25132%1/((2/(ha*Aa))+R)
K = c*m

Ti = 23.64
Tf = @(t) Ti + (A/P)*(1-exp(-((P/K)*t)))
%Tf = @(t,A,P) Ti + (A/P)*(1-exp(-((P/K)*t)))

%ft = fittype(@(x,A,P) Tf(x,A,P),'problem',{'A','P'},'independent','x','dependent','T')

range = linspace(0,12000,1000);

Data = [35,24.8300000000000;70,25.9200000000000;105,26.9400000000000;140,27.9600000000000;175,28.9300000000000;210,29.8400000000000;245,30.8000000000000;280,31.6900000000000;315,32.6200000000000;350,33.5200000000000;385,34.3300000000000;420,35.1800000000000;455,35.9800000000000;490,36.8200000000000;525,37.5400000000000;560,38.3600000000000;595,39.0400000000000];

Data = [0, 23.64; Data]


close all
hold on
plot(range, Tf((range*2*pi)/w))
%Data(:,1) = Data(:,1)/(w/(2*pi))

plot(Data(:,1), Data(:,2), 'o')
xlim([0,12000])

xlabel('Roll');
ylabel('Temperature(^{\circ}C)');
legend('FittingCurve','Datapoint')

hold off

E = corrcoef(Data(:,2), Tf(Data(:,1)*2*pi/w));
E(1,2)

%Tf = @(t) Ti + (A/(4.18*P))*(1-exp(-((P/K)*t)))

syms t
limit(Tf(t),t,inf);

double(ans)
%w/(2*pi)