clear
close all;
open_system('P1_sim');

%Encontrar a cena do zeno do P1
%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P1_sim', 'ZeroCrossAlgorithm','Adaptive');

set_param('P1_sim', 'StopTime','25');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

elasticidade =-0.8;
velocidade = 0;


cores = [[0 0.4470 0.7410];
            [0.8500 0.3250 0.0980];
            [0.9290 0.6940 0.1250];
            [0.4940 0.1840 0.5560];
            [0.4660 0.6740 0.1880];
            [0.3010 0.7450 0.9330];
            [0.6350 0.0780 0.1840];
            [0 0.4470 0.7410];
        ];
    
%Variar a elasticidade%

set_param('P1_sim/Velocidade_inicial','Value','0');
for jj=1:1:8
    set_param('P1_sim/Elasticidade_da_bola','Gain',num2str(elasticidade));
    out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.z;
    axis([0 12 0 12]);
    legend();
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'DisplayName', sprintf('Elasticidade %0.1f',elasticidade));
    hold all;
    elasticidade = elasticidade + 0.1;
%     Tfinal = Tfinal*0.8;
    pause(0.1)
    disp(elasticidade)
end

%Variar a velocidade inicial%
elasticidade =-0.8;
set_param('P1_sim/Elasticidade_da_bola','Gain','-0.8');
figure
for jj=1:1:5
    
    set_param('P1_sim/Velocidade_inicial','Value',num2str(velocidade));
    out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    xi=out.z;
    axis([0 16 0 14])
    legend();
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'DisplayName', sprintf('Velocidade %d',velocidade));
    hold all;
    velocidade = velocidade + 2;
    pause(0.1)
    disp(elasticidade)
end

hold off
