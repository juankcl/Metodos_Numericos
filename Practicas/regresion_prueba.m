function regresion_prueba ()
clc;
close all;
clear all;
 
dx = 0.5;
x_min = -10;
x_max = 10;
r = 2.0;
x = x_min:dx:x_max;
y = -0.3*x.^2+.05*x-2;
Ne = length(y);
sr = sin(2*r*rand(1,Ne)-r)./rand(1,Ne);
%sr = sin(2*r*rand(1,Ne)-r);
yr = y+sr;
sx2 = x*x';
sx = x*ones(Ne,1);
sx3 = (x.*x)*x';
sx4 = (x.*x.*x)*x';
sy = yr*ones(Ne,1);
sxy = x*yr';
sx2y = (x.*x)*yr';
M = [sx2 sx Ne; sx3 sx2 sx; sx4 sx3 sx2];
v = [sy; sxy; sx2y];
%a = inv(M)*v;
a = M\v;
y2 = a(1)*x.^2+a(2)*x+a(3);
 
figure();
plot(x,y,'r-',x,yr,'b*', x, y2, 'g-');
xlabel('x');
ylabel('f(x)');