clear
close all

a = 0.09;
Kt = 10;
b = 1;

syms v

% a) e b)
% Equacoes a resolver
Equacao_eq = a*v*(1-v/Kt) == 0;
Equacao_pos = a*v*(1-v/Kt) > 0;
Equacao_neg = a*v*(1-v/Kt) < 0;

% Soluções das equações
V_eq = solve(Equacao_eq, v);
V_pos = solve(Equacao_pos, v, 'ReturnConditions', true);
V_neg = solve(Equacao_neg, v, 'ReturnConditions', true);

% escrever os resultados
disp('Pontos no equilíbrio:')
disp(V_eq)
disp('Intervalo em que a derivada é positiva:')
disp(V_pos.conditions)
disp('Intervalo em que a derivada é negativa:')
disp(V_neg.conditions)

% c)
% Determinar, para cada valor de V0, o valor de u que conduz
% à derivada ser negativa
U_lim = zeros(1, 10);
V0 = [1,2,3,4,5,6,7,8,9,10];
for k = 1:length(V0)
    v0 = V0(k);
    u_lim = (a - a/Kt*v0)/b;
    U_lim(k) = u_lim;
end
plot(V0, U_lim)
xlabel('Volume inicial do tumor')
ylabel('Valor de u necessário para que o tumor diminuia')

% Para ter um plotzinho bacano a mostrar que um volume n pode ser nagtivo
% for u = 0:0.1:1
%     h=0.1;
%     Vol = zeros(1, 50);
%     Vol(1) = 1;
%     for k = 1:length(Vol)-1
%        Vol(k+1) = Vol(k) + h*(a*Vol(k)*(1-Vol(k)/Kt) - b*u*Vol(k));
%     end
%     plot(0:length(Vol)-1, Vol)
%     hold on
% end
