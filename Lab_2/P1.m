close all;
Njogadas=2000;
NMC=1; %Número de runs
Ndiscard=0;
Ncasas=7;
z = zeros(NMC,Ncasas); %número de estados do jogo, que indica o número de vezes que se caiu em cada casa
y = zeros(1,Njogadas); % dimensão igual ao número de jogadas em cada run de Monte Carlo, que indica as casas em que se caiu em cada jogada
Aluguer = [10,10,0,15,20,25,35];
estados = [2,3,4,5,6,3,1;
           3,4,5,6,3,7,2]; %representação da máquina de estados a posição estados(1,1) representa a casa onde se vai para caso estejamos na casa 1 e calhe cara
Lucro_av = zeros(1,Ncasas);
coinflips = zeros(1,Njogadas);
zfreq = zeros(1,Ncasas);
%rand('state',0)
espera = 0;
first = 1;
hh = waitbar(espera,"Doing stuff");


for i=1:1:NMC
    x = 0; %variável escalar que indica o número do estado em que a marca do jogador está em cada instante;
    espera = espera + 1/NMC;
    waitbar(espera,hh,"Doing stuff");
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
    if first == 1
        figure(10)
        plot(1:1:Njogadas+1, y, 'o')
        xlabel('Nº da Jogada')
        ylabel('Estado da marca')
        figure(11)
        plot(1:1:Njogadas+1, coinflips, 'o')
        xlabel('Nº da Jogada')
        ylabel('Resultado da moeda')
        first = 0;
    end
end
for i=1:1:Ncasas
    zfreq(i) = sum(z(:,i))/((Njogadas-Ndiscard)*NMC);
    Lucro_av(i) = Aluguer(i) * zfreq(i);
end
figure(1)
b = bar(1:7, zfreq(1,:),'FaceColor','flat');
xlabel('Nº da casa')
ylabel('Probabilidade de calhar cada casa')
b.CData(1:3,:)=[0, 0.4470 ,0.7410 ;0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250];
b.CData(4:6,:)=[0, 0.4470 ,0.7410 ;0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250];

figure(2)
b1 = bar(1:7, Lucro_av(1,:),'FaceColor','flat');
xlabel('Nº da casa')
ylabel('Lucro médio de cada casa[€/Jogada]')

b1.CData(1:3,:)=[0, 0.4470 ,0.7410 ;0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250];
b1.CData(4:6,:)=[0, 0.4470 ,0.7410 ;0.8500, 0.3250, 0.0980;0.9290, 0.6940, 0.1250];
close(hh)
