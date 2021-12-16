%Função p2
%   Variáveis de entrada:
%       -c1_inicial: condição inicial para a concentração 1       
%       -c2_inicial: condição inicial para a concentração 2
%       -dosagem: dose (em mg) administrada        
%       -dias: Período de tempo a observar (em dias)
%       -dias_entre_dosagem: Período de tempo entre cada toma do fármaco (em dias)
%       -d: variável como definida no enunciado (para p5 passar como argumento um array não nulo)
%    Variáveis de saída:
%       -c1: Array de floats referente à concentração 1       
%       -c1: Array de floats referente à concentração 2    



function [c1,c2] = p1_vers2(c1_inicial,c2_inicial,dosagem,dias,dias_entre_dosagem,d)
    
    %Declaração dos vetores a utilizar.%
    if size(d) < 1        
        d = upsample(zeros(1,dias)+dosagem,dias_entre_dosagem); 
    end
    X = zeros(2,(dias)-1); %X contém os valores de c1 na primeira linha e c2 na segunda linha
    
    
    %Dados do problema%
    h=1;
    K12 = 0.3 * 3600;
    K21 = 0.2455 * 3600;
    K10 = 0.0643 * 3600;
    V1 = 3110;
    V2 = 3110;
    delta = 1000;
    
    %condições iniciais%
    X(1,1) = c1_inicial;
    X(2,1) = c2_inicial;
    
    
    Matriz = zeros(2,2);
    Matriz = [(1/V1)*(-K12-K10),(1/V1)*K21;(1/V2)*K12,(-1/V2)*K21];
    
    d = d(1:dias);
    d = d*(1/V1)*delta;

    for k = 1:length(X(1,:)-1)
        X(:,k+1) = (X(:,k*h)+ h*(Matriz*([X(1,k);X(2,k)])));
        X(1,k+1) = X(1,k+1) + d(k);

    end
    c1 = X(1,:);
    c2 = X(2,:);
    
    %plot(0:1:dias-1,X(1,:),0:1:dias-1,X(2,:),0:1:dias-1,d);
    % figure(1)
end

