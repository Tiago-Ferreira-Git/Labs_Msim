clear
close all;
open_system('P4_sim');
warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

%definição das condições iniciais e dos parametros de simulação:
coef_chao = 0.9;
coef_parede = 0.7;
distancia_parede = 20;
v0z = 0;
v0y = 2;
z0 = 10;
y0 = 0;

set_param('P4_sim', 'ZeroCrossAlgorithm','Adaptive');
set_param('P4_sim', 'StopTime','25');
set_param('P4_sim/coef_rest_chao','Gain', num2str(-coef_chao));
set_param('P4_sim/coef_rest_parede','Gain', num2str(-coef_parede));
set_param('P4_sim/d_parede','Value', num2str(distancia_parede));
set_param('P4_sim/v0_z','Value', num2str(v0z));
set_param('P4_sim/v0_y','Value', num2str(v0y));
set_param('P4_sim/z0','Value', num2str(z0));
set_param('P4_sim/y0','Value', num2str(y0));

% correr a simulação
out=sim('P4_sim', 'SaveTime', 'on', 'SaveState', 'on');    
ti = out.tout;
zi = out.z;
yi = out.y;


%traçado dos gráficos relevantes
figure(1)
plot(yi.data,zi.data, 'color', '#0072BD', 'LineWidth', 1.5);
hold on

% só para desenhar uma parede lol:
altura_parede = 10;
%tijolo
paredex(1) = distancia_parede + 0.83;
paredex(2) = distancia_parede + 0.83001;
paredey(1) = 0;
paredey(2) = 10; 
plot(paredex, paredey, 'color', '#D95319', 'LineWidth', 20);
%cimento horizontal
px(1) = distancia_parede + 0.1;
px(2) = distancia_parede + 1.5;
for t = 0:0.5:altura_parede
    py(1) = t;
    py(2) = t;
    plot(px, py, 'color', '#b4af95', 'LineWidth', 1.5);
end
%cimento vertical:
px(1) = distancia_parede + 0.83;
px(2) = distancia_parede + 0.83001;
par = 1;
for t = 0:0.5:altura_parede
    if rem(par,2) == 0
        py(1) = t;
        py(2) = t+0.5;
        plot(px, py, 'color', '#b4af95', 'LineWidth', 1.5);
    end
    par = par +1;
end

legend('Trajectória', 'Parede')
axis([0 (distancia_parede+3) 0 (z0+2)])

xlabel('Y - m')
ylabel('Z - m')


% figure(2)
% plot(zi.Time,zi.data);
% axis([0 16 0 14])
% pause(0.1)
% ylabel('Z [m]')
% xlabel('Tempo [s]')
% 
% figure(3)
% plot(yi.Time,yi.data);
% axis([0 16 -10 14])
% pause(0.1)
% ylabel('Y [m]')
% xlabel('Tempo [s]')
