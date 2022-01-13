close all;
Njogadas=30;
NMC=10000; %Número de runs ( aumentar este numero leva a resultados mais uniformes)
Ncasas=7;
Aluguer = [10,10,0,15,20,25,35];
estados = [2,3,4,5,6,3,1;
           3,4,5,6,3,7,2]; %representação da máquina de estados a posição estados(1,1) representa a casa onde se vai para caso estejamos na casa 1 e calhe cara
counter4 = zeros(1, Njogadas);


%rand('state',0)
espera = 0;
hh = waitbar(espera,"Doing stuff");
for casa = 1:1:7
    counter4 = zeros(1, Njogadas);
    for i=1:1:NMC
        x = 0; %variável escalar que indica o número do estado em que a marca do jogador está em cada instante;
        espera = espera + 1/NMC/7;
        waitbar(espera,hh,"Doing stuff");
        for k=1:1:Njogadas %+1 %se se contar com a jogada 0 +50 jogadas         
            avanca = randi([1 2]); % lançamento da moeda
            if x == 0              % no inicio está "fora do tabuleiro"
                x = avanca;        % ou vai para o 1 ou para o 2
            else    
                x = estados(avanca,x);  % avança segundo o diagrama
            end
            if x == casa
                counter4(k) = counter4(k)+1; %assinala que na jogada k calhou a casa 4 na run i 
            end
        end     
    end
    freq4 = counter4/NMC; % calcula a frequencia com que em cada jogada calhou a casa 4
    figure(1+casa*10)
    plot(0:1:Njogadas-1, freq4, 'o--')
    xlim([0,Njogadas])
    xlabel('Nº da jogada')
    ylabel("Probabilidade de calhar o estado " + casa)
%     figure(2+casa*10)
%     bar(0:1:Njogadas-1, freq4)
%     xlim([0,Njogadas])
%     xlabel('Nº da jogada')
%     ylabel("Probabilidade de calhar o estado " + casa)
end
close(hh)
