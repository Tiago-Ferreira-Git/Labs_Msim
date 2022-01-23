clear
close all;
open_system('P2_sim');

%Encontrar a cena do zeno do P1
%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P2_sim', 'ZeroCrossAlgorithm','Adaptive');

set_param('P2_sim', 'StopTime','25');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

atritop=0;
atritom=0;
velocidade = 0;

%Variar o atrito%
set_param('P2_sim/Velocidade_inicial','Value',num2str(velocidade));
set_param('P2_sim/Elasticidade_da_bola','Gain','-0.8');
for jj=1:1:3
    set_param('P2_sim/Atrito_do_ar+','Gain',num2str(atritom));
    out=sim('P2_sim', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.z;
    axis([0 12 0 12]);
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Atrito %0.1f',atritom));
    hold all;
    atritom = atritom - 0.4;
    pause(0.1)
end
hold off;

figure
%Variar o atrito%
set_param('P2_sim/Velocidade_inicial','Value',num2str(velocidade));
set_param('P2_sim/Elasticidade_da_bola','Gain','-0.8');
atritom = 0;
for jj=1:1:3
    set_param('P2_sim/Atrito_do_ar+','Gain',num2str(atritom));
    out=sim('P2_sim', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.v;
    axis([0 12 -10 10]);
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Velocidade - m/s')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Atrito %0.1f',atritom));
    hold all;
    atritom = atritom - 0.4;
    pause(0.1)
end
hold off;


figure
%Variar o atrito%
set_param('P2_sim/Velocidade_inicial','Value',num2str(velocidade));
set_param('P2_sim/Elasticidade_da_bola','Gain','-0.8');
atritom = 0;
for jj=1:1:3
    set_param('P2_sim/Atrito_do_ar+','Gain',num2str(atritom));
    out=sim('P2_sim', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.a;
    axis([0 12 -16 0]);
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Acelaração - m/s^2')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Atrito %0.1f',atritom));
    hold all;
    atritom = atritom - 0.4;
    pause(0.1)
end
hold off;