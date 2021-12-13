Num_dias = 60*6

c2 = zeros(1,Num_dias);
[~,c2] = p1_vers2(1,1,500,Num_dias/6);

u = zeros(1,Num_dias);
v = zeros(1,Num_dias);
a = 0.09;
KT = 10;
b = 1;
h=1;
for i= 1:length(u)
    u(i) = c2(i)/(7.1903+c2(i));
end


plot(1:1:Num_dias,u(:));