% irrelevante pq já está implementado no p4

Num_dias = 100;
Vol_inicial = 5;
h=1;
u = zeros(1, Num_dias)+0.5;
Vol = zeros(1, Num_dias);

a = 0.09;
Kt = 10;
b = 1;

Vol(1) = Vol_inicial;
for k = 1:length(Vol)-1
   Vol(k+1) = Vol(k) + h*(a*Vol(k)*(1-Vol(k)/Kt) - b*u(k)*Vol(k));
end
plot(0:length(Vol)-1, Vol)

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
