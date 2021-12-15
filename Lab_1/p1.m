%Constantes e Vetor d como definido no enunciado%
d1 = upsample(zeros(1,60)+3,6); 
d1 = d1(1:100);
h=1;
K12 = 0.3 * 3600;
K21 = 0.2455 * 3600;
K10 = 0.0643 * 3600;
V1 = 3110;
V2 = 3110;
delta = 1000;
c1 = zeros(1,100);
c2 = zeros(1,100);
%condições iniciais%
c1(1) = 1;
c2(1) = 2;

d = d1*(1/V1)*delta;
for k = 1:length(c1)-1
    c1(k+1) = c1(k * h)+ h*(((1/V1)*(-K12-K10))*c1(k) + (1/V1)*K21*c2(k) + d(k));
    c2(k+1) = c2(k * h)+ h*(((1/V2)*(K12))*c1(k) + (-1/V2)*K21*c2(k));
end

figure(1)
gg = plot(0:1:99,c1,0:1:99,c2);
axis([0 99 1 3]);
set(gg,'LineWidth',1.5)
legend(gg,'C1','C2','Location','SouthEast')

figure(2)
gg = plot(0:1:99,d1);
axis([0 99 0 4]);
set(gg,'LineWidth',1.5,'Color','magenta')

%set(c2,'LineWidth',1.5,'Color','red')



