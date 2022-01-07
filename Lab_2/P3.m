close all;
Njogadas=100;
NMC=1000; %Número de runs
Ncasas=7;
Aluguer = [10,10,0,15,20,25,35];
estados = [2,3,4,5,6,3,1;
           3,4,5,6,3,7,2]; %representação da máquina de estados a posição estados(1,1) representa a casa onde se vai para caso estejamos na casa 1 e calhe cara
counter4 = zeros(1, Njogadas);


%rand('state',0)
espera = 0;
hh = waitbar(espera,"Doing stuff");

for i=1:1:NMC
    x = 0; %variável escalar que indica o número do estado em que a marca do jogador está em cada instante;
    espera = espera + 1/NMC;
    waitbar(espera,hh,"Doing stuff");
    for k=1:1:Njogadas         
        avanca = randi([1 2]); % lançamento da moeda
        if x == 0              % no inicio está "fora do tabuleiro"
            x = avanca;        % ou vai para o 1 ou para o 2
        else    
            x = estados(avanca,x);  % avança segundo o diagrama
        end
        if x == 4
            counter4(k) = counter4(k)+1; %assinala que na jogada k calhou a casa 4 na run i 
        end
    end     
end
freq4 = counter4/NMC; % calcula a frequencia com que em cada jogada calhou a casa 4
figure(1)
bar(1:Njogadas, freq4)
xlabel('Nº da jogada')
ylabel('Probabilidade de calhar o estado 4')
close(hh)
