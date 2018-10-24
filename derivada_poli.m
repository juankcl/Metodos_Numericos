function [vnew]=derivada_poli(v)
%{
UNIVERSIDAD DE GUANAJUATO
Juan Carlos Carrasco López
Calcular la derivada de un polinomio de grado N, regresa un vector con las constantes derivadas
%}
grado=length(v)-1;
vnew=zeros(grado,1);
for i=1:grado;
    vnew(i)=[grado*v(i)];
    grado=grado-1;
end