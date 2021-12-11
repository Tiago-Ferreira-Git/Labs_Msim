%correr primeiro p1
u = zeros(1,360);
v = zeros(1,360);
a = 0.09;
KT = 10;
b = 1;
v(1) = 0;
h=1;
for i= 1:length(u)
    u(i) = c2(i)/(7.1903+c2(i));
end


for k = 1:length(v)
    v(k+1) = v(k * h)+ h*(a*v(k)*(1-(v(k)/KT))-b*u(k)*v(k));
end


