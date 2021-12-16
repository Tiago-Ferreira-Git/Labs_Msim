% modelar o efeito de R com uma equação diferencial
%
%               R'(t) = a*u(t) + b*R(t) , u < 0.2
%               R'(t) = 0 ,           u > 0.2   

clear 
close all

% parametros
h=1;
dias = 100;
a=0.1;
b=0.05;
c = 0.001; %crescimento natural da resistencia 

% pre-alocar os vetores
R = zeros(1, dias);


% efeito elevado
figure(1)
u1 = p2(20, dias, 5);
hold on
R(1) = 0;
for k = 1:length(R)-1
    if u1(k) < 0.3
        R(k+1) = R(k) + h*(a*u1(k) + b*R(k));
    else
        R(k+1) = (1+c)*R(k);
    end
end
plot(0:length(R)-1, R);

% efeito reduzido
figure(2)
u2 = p2(10, dias, 10);
hold on
R(1) = 0;
for k = 1:length(R)-1
    if u2(k) < 0.3
        R(k+1) = R(k) + h*(a*u2(k) + b*R(k));
    else
        R(k+1) = (1+c)*R(k);
    end
end
plot(0:length(R)-1, R);


