function [matrix]= regresion(xvector,yvector,entero,gdo,matrix,i2)


Ne = length(yvector);
sx2 = xvector*xvector';
sx = xvector*ones(Ne,1);
sx3 = (xvector.*xvector)*xvector';
sx4 = (xvector.*xvector.*xvector)*xvector';
sy = yvector*ones(Ne,1);
sxy = xvector*yvector';
sx2y = (xvector.*xvector)*yvector';
M = [sx2 sx Ne; sx3 sx2 sx; sx4 sx3 sx2];
v = [sy; sxy; sx2y];
%a = inv(M)*v;
a = M\v;
%y2 = a(1)*xvector.^2+a(2)*xvector+a(3);
matrix(i2,:)=a;

%figure();
%plot(xvector,y2);
%xlabel('x');
%ylabel('f(x)');
%grid on;
