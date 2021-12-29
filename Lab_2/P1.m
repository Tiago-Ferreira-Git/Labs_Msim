close all;
Njogadas=200;
NMC =2; %Número de runs
Ndiscard=0;
Ncasas=7;
z = zeros(NMC,Ncasas); %número de estados do jogo, que indica o número de vezes que se caiu em cada casa
y = zeros(1,Njogadas); % dimensão igual ao número de jogadas em cada run de Monte Carlo, que indica as casas em que se caiu em cada jogada
Aluguer = [10,10,0,15,20,25,0,35];
estados = [2,3,4,5,6,3,1;3,4,5,6,3,7,2]; %representação da máquina de estados a posição estados(1,1) representa a casa onde se vai para caso estejamos na casa 1 e calhe cara
Lucro = zeros(NMC,Ncasas);

rand('state',0)
espera = 0;
hh = waitbar(espera,"Doing stuff");

for i=1:1:NMC
    x = 1; %variável escalar que indica o número do estado em que a marca do jogador está em cada instante;
    %z(i,x) = z(i,x)+1; %Começar no 1 conta para a freq? y(i,1) tem que ser 1?
    espera = espera + 1/NMC;
    waitbar(espera,hh,"Doing stuff");
    for k=1:1:Njogadas 
        avanca = randi([1 2]);
        x = estados(avanca,x);
        y(1,k) = x;
        if k > Ndiscard   
            z(i,x) = z(i,x)+1;
        end
    end 
    for k=1:1:Ncasas
        Lucro(i,k) = Aluguer(k) * z(i,k)/Njogadas;
    end 
end
zfreq = z / Njogadas;

%To do: fazer gráficos da resposta 1 a)


figure(1)
bar(zfreq)
%figure(2)
%bar(y)
close(hh)