function bolo()
load Datos_1_1.txt
format long
T=Datos_1_1(1,:)
%T=[280 650 1000 1200 1500 1700]
Cp=Datos_1_1(2,:)
a=polyfit(T,Cp,101);
subplot(2,1,1)
plot(a)
subplot(2,1,2)
plot(T,Cp)
fprintf('a0=%8.5f al=%9.6f a2=%9.6f\n a3=%9.6f\n',a(4),a(3),a(2),a(1))
Tint=800;
Cpint=a(3)+a(2)*Tint+ a(1)*Tint^2
fprintf('Cp(%4.0f)=%6.1f\n´',Tint,Cpint)
