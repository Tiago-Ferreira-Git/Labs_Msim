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

numero_de_maximos = 7;
alt_max = zeros(numero_de_maximos,numero_de_maximos);
for jj=1:1:numero_de_maximos
    set_param('P2_sim_bex/Atrito_do_ar','Gain',num2str(atrito));
    out=sim('P2_sim_bex', 'SaveTime', 'on', 'SaveState', 'on');
    ti=out.tout;
    
    figure(1)
    xi=out.z;
    lgd = legend;
    lgd.FontSize = 10;
    xlabel('Tempo - s')
    ylabel('Posição - m')
    plot(xi.Time,xi.data,'LineWidth',1.4,'DisplayName', sprintf('Atrito %0.1f',abs(atrito)));
    hold all;
    
    figure(2)
    xi=out.v;
    lgd = legend;
    lgd.FontSize = 10;
    axis([0 20 -15 15])
    xlabel('Tempo - s')
    ylabel('Velocidade - m/s')
    plot(xi.Time,xi.data,'LineWidth',1.4,'DisplayName', sprintf('Atrito %0.1f',abs(atrito)));
    hold all;
    
    figure(3)   
    xi=out.a;
    lgd = legend;
    lgd.FontSize = 10;
    xlabel('Tempo - s')
    ylabel('Acelaração - m/s^2')
    plot(xi.Time,xi.data,'LineWidth',1.4,'DisplayName', sprintf('Atrito %0.1f',abs(atrito)));
    hold all;
    xi = out.z
    atrito = atrito - 0.8;
    alt_max(jj,1) = max(xi.data');
    k=1;
    for i=1:1:length(xi.data)
        if xi.data(i) == 0
            if(k > numero_de_maximos)
                break;
            end
            k = k+1;
            alt_max(jj,k)= max(xi.data(i:length(xi.data))');
        end
    end
    pause(1)
end
hold off;


height_quocient = zeros(numero_de_maximos,length(alt_max(1,:))-1);
gaussian_params = zeros(2,numero_de_maximos);
for jj=1:1:numero_de_maximos
    for i=1:1:length(alt_max(1,:))-1
        if alt_max(jj,i+1)/alt_max(jj,i) == 0
            height_quocient(jj,i) = NaN;
        else
            height_quocient(jj,i) = alt_max(jj,i+1)/alt_max(jj,i);
        end
        
    end
    %standart deviation
    gaussian_params(1,jj) = std(height_quocient(jj,:),'omitnan');
    %mean
    gaussian_params(2,jj) = mean(height_quocient(jj,:),'omitnan');
end