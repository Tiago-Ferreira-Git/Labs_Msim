close all;
Njogadas=1000;
NMC=100; %Número de runs
Ndiscard=10;
Ncasas=7;
Aluguer = [10,10,0,15,20,25,35];
estados = [2,3,4,5,6,3,1;
           3,4,5,6,3,7,2]; %representação da máquina de estados a posição estados(1,1) representa a casa onde se vai para caso estejamos na casa 1 e calhe cara
erro_relativo = zeros(Ncasas,floor(sqrt(NMC)));
for jj=1:1:NMC
    coinflips = zeros(1,Njogadas);
    zfreq = zeros(NMC,Ncasas);
    z = zeros(NMC,Ncasas); %nzúmero de estados do jogo, que indica o número de vezes que se caiu em cada casa
    y = zeros(1,Njogadas); % dimensão igual ao número de jogadas em cada run de Monte Carlo, que indica as casas em que se caiu em cada jogada    

    for i=1:1:NMC
        x = 0; %variável escalar que indica o número do estado em que a marca do jogador está em cada instante;
        for k=1:1:Njogadas+1 % a inicial n conta para o nº de jogadas         
            avanca = randi([1 2]); % lançamento da moeda
            coinflips(k)=avanca;
            if x == 0              % no inicio está "fora do tabuleiro"
                x = avanca;        % ou vai para o 1 ou para o 2
            else    
                x = estados(avanca,x);  % avança segundo o diagrama
            end
            y(k) = x;
            if k > Ndiscard+1    
                z(i,x) = z(i,x)+1;
            end
        end 
    end
    for n = 1:1:NMC
        for i=1:1:Ncasas
            zfreq(n,i) = sum(z(1:n,i))/((Njogadas-Ndiscard)*n);
        end 
    end
    for i = 1:1:Ncasas
       if floor(sqrt(jj)).^2 == jj
           erro_relativo(i,floor(sqrt(jj))) = abs((zfreq(NMC,i)-zfreq(jj,i))/zfreq(NMC,i));
       end
    end
end


for i=1:1:Ncasas
    figure(i)
    plot(1:1:length(erro_relativo(i,:))-1,erro_relativo(i,1:(length(erro_relativo(i,:))-1)));
    xlabel('Raiz quadrada do número de runs')
    ylabel('Erro relativo')
end 

