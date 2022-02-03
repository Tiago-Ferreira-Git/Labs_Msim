clear
close all;
open_system('P1_sim');

%Encontrar a cena do zeno do P1
%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P1_sim', 'ZeroCrossAlgorithm','Adaptive');

set_param('P1_sim', 'StopTime','25');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

elasticidade =-0.8;
velocidade = -9;

%Variar a elasticidade%
set_param('P1_sim/Velocidade_inicial','Value','0');
figure(1)
numero_de_maximos = 1;
alt_max = zeros(numero_de_maximos,numero_de_maximos);
% for jj=1:1:numero_de_maximos
%     set_param('P1_sim/Elasticidade_da_bola','Gain',num2str(elasticidade));
%     out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
%     ti=out.tout;
%     xi=out.z;
%     axis([12.857 12.8573 0 5e-09]);
%     hold on;
%     %12.85714286
%     plot(12.85714,0,'b*','DisplayName','T_{infito}')
%     hold on;    lgd = legend;
%     lgd.FontSize = 12;
%     xlabel('Tempo - s')
%     ylabel('Posição - m')
%     plot(xi.Time,xi.data,'LineWidth',1.5,'DisplayName', sprintf('Elasticidade %0.1f',abs(elasticidade)),'color',[0, 0.4470 ,0.7410]);
%     hold all;
%     elasticidade = elasticidade + 0.1;
%     pause(0.01)
%     alt_max(jj,1) = max(xi.data');
%     k=1;
%     for i=1:1:length(xi.data)
%         if xi.data(i) == 0
%             if(k > numero_de_maximos)
%                 break;
%             end
%             k = k+1;
%             alt_max(jj,k)= max(xi.data(i:length(xi.data))');
%         end
%     end
% end

% height_quocient = zeros(numero_de_maximos,length(alt_max(1,:))-1);
% gaussian_params = zeros(2,numero_de_maximos);
% for jj=1:1:numero_de_maximos
%     for i=1:1:length(alt_max(1,:))-1
%         if alt_max(jj,i+1)/alt_max(jj,i) == 0
%             height_quocient(jj,i) = NaN;
%         else
%             height_quocient(jj,i) = alt_max(jj,i+1)/alt_max(jj,i);
%         end
%         
%     end
%     %standart deviation
%     gaussian_params(1,jj) = std(height_quocient(jj,:),'omitnan');
%     %mean
%     gaussian_params(2,jj) = mean(height_quocient(jj,:),'omitnan');
% end
% 
% hold off;
% %Variar a velocidade inicial%
elasticidade =-0.8;
set_param('P1_sim/Elasticidade_da_bola','Gain','-0.8');
figure(2)
for jj=1:1:5
    
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
    velocidade = velocidade + 3;
    pause(1)
    disp(velocidade);
end
hold off

% %0.0005
% set_param('P1_sim', 'StopTime','60');
% figure(3)
% set_param('P1_sim/Elasticidade_da_bola','Gain','-0.8');
% out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
% ti=out.tout;
% xi=out.z;
% plot(xi.Time,xi.data,'DisplayName', sprintf('Elasticidade %0.1f',elasticidade));
% axis([57.90 57.95 0 0.2*1e-4]);
% xlabel('Tempo - s')
% ylabel('Posição - m')



