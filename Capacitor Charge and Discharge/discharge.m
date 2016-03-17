% in DisCharge


clc;
clear all;
close all;

V0 = 10;

DV = @(V0,t,R,C) V0*(exp(-1.*t/(R*C)));
I = @(V0,t,R,C) (1)*(V0/R).*exp((-1.*t)/(R*C));

expnum = 4;
charttitle = ['Exp '  num2str(expnum) ' discharge'];

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
0	-93.1	9.75
2	-80.7	7.88
4	-65.1	6.38
6	-52.6	5.38
8	-42.5	4.36
10	-35.9	3.53
12	-29.0	2.87
14	-23.5	2.32
16	-19.0	1.97
18	-15.4	1.60
20	-13.0	1.30
22	-10.6	1.06
24	-8.9	0.90
26	-7.3	0.73
28	-5.9	0.62
30	-4.8	0.49
]

Data(:,2) = (-1)*(10^(-6))* Data(:,2);

tp = linspace(min(Data(:,1)),max(Data(:,1)),100);




figure



plotLx = [tp'];
plotLy = [I(V0,tp,R,C)];
plotRx = [tp'];
plotRy = [DV(V0,tp,R,C)'];

[HAx,Line1,Line2] = plotyy(plotLx,plotLy,plotRx,plotRy);


xlabel('time(sec)')

ylabel(HAx(1),'Current (A)')
ylabel(HAx(2),'Voltage (V)')


hold(HAx(1),'on')
hold(HAx(2),'on')

Iplot = plot(HAx(1),Data(:,1),Data(:,2),'o');
Vplot = plot(HAx(2),Data(:,1),Data(:,3),'o');

vhorzplot = plot(HAx(2),Data(:,1),(1-0.6321)*max(Data(:,3))*ones(size(Data(:,1))),'g');
vhorzplot2 = plot(HAx(2),Data(:,1),(1-0.6321)*V0*ones(size(Data(:,1))),'r');
tVertplot = plot(HAx(2),R*C(ones(2)),[-100 100],'r');
%tVertplot = plot(HAx(2),R*C(ones(2)),[min(Data(:,3)) , max(Data(:,3))],'r')
set(tVertplot,'linestyle','--')

ihorzplot = plot(HAx(1),Data(:,1),(1-0.6321)*(V0/R)*ones(size(Data(:,1))),'r');
%plot(HAx(1),Data(:,1),(1-(0.632))*(max(Data(:,2)))*ones(size(Data(:,1))),'g')


f1 = fit(Data(:,1),Data(:,2),'exp1')
f2 = fit(Data(:,1),Data(:,3),'exp1')

plot(HAx(1),tp,f1(tp),'--');
plot(HAx(2),tp,f2(tp),'--');

title(charttitle)

hold(HAx(1),'off')
hold(HAx(2),'off')

hold off

%ylim(HAx(1),[10^(-5) 8*10^(-5)])


% axis(HAx(2),'tight')
% axis(HAx(1),'tight')

% legend(Iplot,'Current Data');
% legend(Vplot,'Voltage Data');
% legend(tVertplot,'Time Constant (RC) ');
% legend(vhorzplot,'0.632 Vmax');
% legend(Iplot,'0.632 Imax');
