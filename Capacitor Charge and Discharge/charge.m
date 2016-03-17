% in Charge


clc;
clear all;
close all;

V0 = 10;

DV = @(t,R,C) V0*(1-exp(-1.*t/(R*C)));
I = @(t,R,C) (V0/R).*exp((-1.*t)/(R*C));


expnum = 4;
charttitle = ['Exp '  num2str(expnum) ' Charge'];

element = [
    100 200
    330 200
    330 100
    100 100
    ];

element(:,1) = element(:,1)*(10^(-6));
element(:,2) = element(:,2)*(10^(3));

% 1 : C 100 micro , R 200 kilo
% 
% 2 : C 330 micro , R 200 kilo
% 
% 3 : C 330 micro , R 100 kilo
% 
% 4 : C 100 micro , R 100 kilo
% 

C = element(expnum,1);
R = element(expnum,2);


%Time, Current, Voltage
Data = [
0	93.5	0
2	79.9	1.88
4	67.5	3.43
6	54.8	4.67
8	44.6	5.48
10	37.9	6.32
12	31.0	7.00
14	25.4	7.55
16	21.7	7.91
18	18.6	8.21
20	14.8	8.57
22	12.8	8.79
24	10.7	8.99
26	9.0	9.16
28	7.6	9.27
30	6.7	9.39
]

Data(:,2) = (10^(-6))* Data(:,2);

tp = linspace(min(Data(:,1)),max(Data(:,1)),100);




figure



plotLx = [tp'];
plotLy = [I(tp,R,C)];
plotRx = [tp'];
plotRy = [DV(tp,R,C)'];

[HAx,Line1,Line2] = plotyy(plotLx,plotLy,plotRx,plotRy);


xlabel('time(sec)')

ylabel(HAx(1),'Current (A)')
ylabel(HAx(2),'Voltage (V)')


hold(HAx(1),'on')
hold(HAx(2),'on')

Iplot = plot(HAx(1),Data(:,1),Data(:,2),'o');
Vplot = plot(HAx(2),Data(:,1),Data(:,3),'o');

vhorzplot = plot(HAx(2),Data(:,1),0.632*V0*ones(size(Data(:,1))),'r');
tVertplot = plot(HAx(2),R*C(ones(2)),[-100 100],'r');
%tVertplot = plot(HAx(2),R*C(ones(2)),[min(Data(:,3)) , max(Data(:,3))],'r')
set(tVertplot,'linestyle','--')


ihorzplot = plot(HAx(1),Data(:,1),(1-(0.632))*(V0/R)*ones(size(Data(:,1))),'r');

%plot(HAx(1),Data(:,1),(1-(0.632))*(max(Data(:,2)))*ones(size(Data(:,1))),'g')


f1 = fit(Data(:,1),Data(:,2),'exp1')
f2 = fit(Data(:,1),Data(:,3)-V0,'exp1')

plot(HAx(1),tp,f1(tp),'--')
plot(HAx(2),tp,f2(tp)+V0,'--')

title(charttitle)

hold(HAx(1),'off')
hold(HAx(2),'off')

hold off



% axis(HAx(2),'tight')
% axis(HAx(1),'tight')
