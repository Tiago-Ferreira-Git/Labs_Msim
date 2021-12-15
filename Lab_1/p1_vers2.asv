function [c1,c2] = p1_vers2(c1_inicial,c2_inicial,dosagem,dias,dias_entre_dosagem)
    %Constantes e Vetor d como definido no enunciado%
    d = upsample(zeros(1,dias)+dosagem,dias_entre_dosagem); 
    h=1;
    K12 = 0.3 * 3600;
    K21 = 0.2455 * 3600;
    K10 = 0.0643 * 3600;
    V1 = 3110;
    V2 = 3110;
    delta = 1000;
    X = zeros(2,(dias*dias_entre_dosagem)-1);
    %condições iniciais%
    X(1,1) = c1_inicial;
    X(2,1) = c2_inicial;
    length(X(1,:))
    Matrix = zeros(2,2);
    Matrix = [(1/V1)*(-K12-K10),(1/V1)*K21;(1/V2)*K12,(-1/V2)*K21];
    
    d = d*(1/V1)*delta;

    for k = 1:length(X(1,:)-1)
        X(:,k+1) = (X(:,k*h)+ h*(Matrix*([X(1,k);X(2,k)])));
        X(1,k+1) = X(1,k+1) + d(k);

    end
    c1 = X(1,:);
    c2 = X(2,:);
    
    %plot(1:1:dias*dias_entre_dosagem,X(1,:),1:1:dias*dias_entre_dosagem,X(2,:),1:1:dias*dias_entre_dosagem,d);
    % figure(1)

