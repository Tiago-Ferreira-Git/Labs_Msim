clear
close all

a = 0.09;
Kt = 10;
b = 1;

% syms v
% 
% % Equacoes a resolver
% Equacao = a*v*(1-v/Kt) == 0;
% Equacao_pos = a*v*(1-v/Kt) > 0;
% Equacao_neg = a*v*(1-v/Kt) < 0;
% 
% % Soluções das equações
% V_eq = solve(Equacao, v);
% V_pos = solve(Equacao_pos, v, 'ReturnConditions', true);
% V_neg = solve(Equacao_neg, v, 'ReturnConditions', true);
% 
% % escrever os resultados
% disp('Pontos no equilíbrio:')
% disp(V_eq)
% disp('Intervalo em que a derivada é positiva:')
% disp(V_pos.conditions)
% disp('Intervalo em que a derivada é negativa:')
% disp(V_neg.conditions)

% determinar V(h) tal que
% V'(h) =  a*V*(1-V/Kt) - b*u*V
% passo:
h = 0.1;
V = zeros(1, 10/h+1);

%testar cenas
V(1) = 5; %?
u = 0.5
for k = 1:length(V)-1
   V(k+1) = V(k) + h*(a*V(k)*(1-V(k)/Kt) - b*u*V(k));
end
plot(1:length(V), V)

% para testar tudo
% for n = 1:10
%     figure(n)
%     % cond. ini.: 
%     V(1) = n; %?
%     for u = 0:0.01:1
%         for k = 1:length(V)-1
%             V(k+1) = V(k) + h*(a*V(k)*(1-V(k)/Kt) - b*u*V(k));
%         end
%         plot(1:length(V), V)
%         hold on
% 
%     end
% end
