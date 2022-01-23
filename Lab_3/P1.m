clear
close all;
open_system('P1_sim');

%Encontrar a cena do zeno do P1
%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P1_sim', 'ZeroCrossAlgorithm','Adaptive');

set_param('P1_sim', 'StopTime','25');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

elasticidade =-0.8;
velocidade = -6;

%Variar a elasticidade%
set_param('P1_sim/Velocidade_inicial','Value','0');
for jj=1:1:8
    set_param('P1_sim/Elasticidade_da_bola','Gain',num2str(elasticidade));
    out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.z;
    axis([0 12 0 12]);
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Elasticidade %0.1f',elasticidade));
    hold all;
    elasticidade = elasticidade + 0.1;
    %   Tfinal = Tfinal*0.8;
    pause(0.1)
    disp(elasticidade)
end
hold off;
%Variar a velocidade inicial%
elasticidade =-0.8;
set_param('P1_sim/Elasticidade_da_bola','Gain','-0.8');
figure
for jj=1:1:7
    
    set_param('P1_sim/Velocidade_inicial','Value',num2str(velocidade));
    out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.z;
    axis([0 16 0 14])
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Velocidade %d',velocidade));
    hold all;
    velocidade = velocidade + 2;
    pause(0.1)
    disp(elasticidade)
end
hold off

% 0.0005
set_param('P1_sim', 'StopTime','60');
figure
set_param('P1_sim/Elasticidade_da_bola','Gain','-0.8');
out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
ti=out.tout;
xi=out.z;
plot(xi.Time,xi.data,'DisplayName', sprintf('Elasticidade %0.1f',elasticidade));
axis([57.90 57.95 0 0.2*1e-4]);
xlabel('Tempo - s')
ylabel('Posição - m')



