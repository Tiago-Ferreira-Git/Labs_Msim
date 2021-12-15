Num_dias = 90

c2 = zeros(1,Num_dias);
[~,c2] = p1_vers2(0,0,2,Num_dias,6);

u = zeros(1,Num_dias);
v = zeros(1,Num_dias);
a = 0.09;
KT = 10;
b = 1;
h=1;
for x=1:10:50
    [~,c2] = p1_vers2(0,0,x,Num_dias,6);
    for i= 1:length(u)
        u(i) = c2(i)/(7.1903+c2(i));
    end
    plot(1:1:Num_dias,u(:));
    hold on
end



%plot(1:1:Num_dias,u(:));