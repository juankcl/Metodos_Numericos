function [vnew]=derivada_poli(v)
grado=length(v)-1;
vnew=zeros(grado,1);
for i=1:grado;
    vnew(i)=[grado*v(i)];
    grado=grado-1;
end