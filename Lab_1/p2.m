%Função p2
%   Variáveis de entrada:
%       -dosagem: dose (em mg) administrada        
%       -dias: Período de tempo a observar (em dias)
%       -dias_entre_dosagem: Período de tempo entre cada toma do fármaco (em dias)
%   
%    Variável de saída:
%       Array de floats correspondente ao parâmetro u como definido no
%       enunciado


function [u] = p2(dosagem,dias,dias_entre_dosagem)
    
    c2 = zeros(1,dias);
    [~,c2] = p1_vers2(0,0,dosagem,dias,dias_entre_dosagem,[]);

    u = zeros(1,dias);
    %Comentar caso não seja necessário reproduzir os gráficos%
%    for x=1:10:50
%        [~,c2] = p1_vers2(0,0,x,dias,dias_entre_dosagem,[]);
%        for i= 1:length(u)
%            u(i) = c2(i)/(7.1903+c2(i));
%        end
%        plot(1:1:dias,u);
%        hold on
%    end
     for i= 1:length(u)
       u(i) = c2(i)/(7.1903+c2(i));
     end
    %plot(1:1:Num_dias,u(:));
end
   