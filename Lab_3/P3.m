clear
close all;
open_system('P3_sim');
warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

%definição das condições iniciais e dos valores dos coeficientes de
%restituição dos pavimentos:
coef1 = 0.95;
coef2 = 0.6;
distancia_ao_pavimento = 10;
v0z = 0;
v0y = 2;
z0 = 10;
y0 = 0;

set_param('P3_sim', 'ZeroCrossAlgorithm','Adaptive');
set_param('P3_sim', 'StopTime','25');
set_param('P3_sim/coef_restituicao1','Gain', num2str(-coef1));
set_param('P3_sim/coef_restituicao2','Gain', num2str(-coef2));
set_param('P3_sim/d_pav','Value', num2str(distancia_ao_pavimento));
set_param('P3_sim/v0_z','Value', num2str(v0z));
set_param('P3_sim/v0_y','Value', num2str(v0y));
set_param('P3_sim/z0','Value', num2str(z0));
set_param('P3_sim/y0','Value', num2str(y0));

% correr a simulação
out=sim('P3_sim', 'SaveTime', 'on', 'SaveState', 'on');
ti = out.tout;
zi = out.z;
yi = out.y;


%traçado dos gráficos relevantes
metros_pav1 = 0:0.1:distancia_ao_pavimento;
pav1 = zeros(1,length(metros_pav1))-0.1;
metros_pav2 = distancia_ao_pavimento:0.1:30;
pav2 = zeros(1,length(metros_pav2))-0.1;

figure(1)
lgd1 = plot(yi.data,zi.data, 'color', '#0072BD', 'LineWidth', 1.5);
hold on
lgd2 = plot(metros_pav1, pav1, 'color', '#D95319', 'LineWidth', 4);
lgd3 = plot(metros_pav2, pav2, 'color', '#77AC30', 'LineWidth', 4);
hold off
axis([0 25 -0.15 12])

legend('Trajectória', 'Pavimento 1 (0.95)', 'Pavimento 2 (0.6)')
% legend(lgd1,'Trajectória')
% legend(lgd2, 'Pavimento 1 (0.95)')
% legend(lgd3, 'Pavimento 2 (0.6)')
xlabel('Y [m]')
ylabel('Z [m]')

% figure(2)
% plot(zi.Time,zi.data);
% axis([0 16 0 14])
% xlabel('Tempo [s]')
% ylabel('Z [m]')
%
% figure(3)
% plot(yi.Time,yi.data);
% axis([0 16 0 14])
% xlabel('Tempo [s]')
% ylabel('Y [m]')

%gráfico animado , n funciona, caguei
% figure(69)
% hold on
% set(gca,'Xlim',[0 25])
% curve=animatedline;
% for ii=1:length(yi)
%     pause(2)
%     plot(yi(ii).data,zi(ii).data);
%     pause(2)
% end
% hold off






