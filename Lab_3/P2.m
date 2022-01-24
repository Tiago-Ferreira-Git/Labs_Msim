clear
close all;
open_system('P2_sim_bex');

set_param('P2_sim_bex', 'ZeroCrossAlgorithm','Adaptive');

set_param('P2_sim_bex', 'StopTime','25');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

atrito=0;
velocidade = 0;

figure(1)
grid on;
axis([0 12 0 12]);
hold all;

figure(2)
grid on;
axis([0 12 -15 12]);
hold all;
 
figure(3)
grid on;
axis([0 12 -16 0]);
hold all;   

%Variar o atrito%
set_param('P2_sim_bex/Velocidade_inicial','Value',num2str(velocidade));
set_param('P2_sim_bex/Elasticidade_da_bola','Gain','-0.8');
for jj=1:1:3
    set_param('P2_sim_bex/Atrito_do_ar','Gain',num2str(atrito));
    out=sim('P2_sim_bex', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    
    figure(1)
    xi=out.z;
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Atrito %0.1f',atrito));
    hold all;
    
    figure(2)
    xi=out.v;
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Velocidade - m/s')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Atrito %0.1f',atrito));
    hold all;
    
    figure(3)   
    xi=out.a;
    lgd = legend;
    lgd.FontSize = 12;
    xlabel('Tempo - s')
    ylabel('Acelaração - m/s^2')
    plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Atrito %0.1f',atrito));
    hold all;
    
    atrito = atrito - 0.4;
    pause(0.1)
end
hold off;