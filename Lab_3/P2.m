clear
close all;
open_system('P2_sim_bex');

%Encontrar a cena do zeno do P1
%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P2_sim_bex', 'ZeroCrossAlgorithm','Adaptive');

set_param('P2_sim_bex', 'StopTime','25');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

atritop=0;
atritom=0;
velocidade = 0;

%Variar a elasticidade%
set_param('P2_sim_bex/Velocidade_inicial','Value','0');
set_param('P2_sim_bex/Elasticidade_da_bola','Gain','-0.8');
for jj=1:1:8
    set_param('P2_sim_bex/Atrito_do_ar+','Gain',num2str(atritop));
    set_param('P2_sim_bex/Atrito_do_ar-','Gain',num2str(atritom));
    out=sim('P2_sim_bex', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.z;
    axis([0 12 0 12]);
    legend();
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'DisplayName', sprintf('Atrito %0.1f',atritop));
    hold all;
    atritop = atritop + 0.1;
    atritom = atritom - 0.1;
    pause(0.1)
end
hold off;
