close all;
Njogadas=100;
NMC=100; %Número de runs
Ndiscard=10;
Ncasas=7;
z = zeros(NMC,Ncasas); %número de estados do jogo, que indica o número de vezes que se caiu em cada casa
y = zeros(1,Njogadas); % dimensão igual ao número de jogadas em cada run de Monte Carlo, que indica as casas em que se caiu em cada jogada
Aluguer = [10,10,0,15,20,25,35];
estados = [2,3,4,5,6,3,1;
           3,4,5,6,3,7,2]; %representação da máquina de estados a posição estados(1,1) representa a casa onde se vai para caso estejamos na casa 1 e calhe cara
coinflips = zeros(1,Njogadas);
zfreq = zeros(NMC,Ncasas);
%rand('state',0)
espera = 0;
hh = waitbar(espera,"Doing stuff");

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

%testing if transitions are right. First bullet point on question P2.
for i = 1:1:(length(y)-1)
    salto = y(i+1) - y(i);
    if(salto ~= 1 && salto ~= 2)
       salto = abs(salto);
       if(salto == 3)
           if(~((y(i) == 6 && y(i+1) == 3) &&  coinflips(i+1) == 1))
                disp("There's a wrong move in this run" )
                disp(i)
           end
       end
       if(salto == 5)
           if(~((y(i) == 7 && y(i+1) == 2)  &&  coinflips(i+1) == 2))
                disp("There's a wrong move in this run"  )
           end
       end
       if(salto == 6)
           if(~((y(i) == 7 && y(i+1) == 1) &&  coinflips(i+1) == 1))
                disp("There's a wrong move in this run"  )
           end
       end
    end
end   


%testing if transitions are right. 
for n = 1:1:NMC
    for i=1:1:Ncasas
        zfreq(n,i) = sum(z(1:n,i))/((Njogadas-Ndiscard)*n);
    end
      espera = espera + 1/NMC;
      waitbar(espera,hh,"Doing stuff");
end
figure(1)
for i = 1:1:Ncasas
    xlim([1,NMC]);
    plot(zfreq(:,i))
    hold on
end
legend('Casa 1','Casa 2','Casa 3','Casa 4','Casa 5','Casa 6','Casa 7');
xlabel('Número de runs')
ylabel('Probabilidade de ocorrência')
grid on

%Last bullet point on question P2. Probability of coinflips

coinflips_frequency = zeros(1,2);
for i=1:1:length(coinflips)
    if coinflips(i) == 1
        coinflips_frequency(1,1) = coinflips_frequency(1,1) + 1; 
    end
    if coinflips(i) == 2
        
        coinflips_frequency(1,2) = coinflips_frequency(1,2) + 1;
    end
end
figure(3)
bar(1:2, coinflips_frequency/Njogadas,'FaceColor','flat')
xlabel('Cara (1) e Coroa (2)')
ylabel('Probabilidade de ocorrência')
%1 corresponde a sair "cara" e um resultado igual a 2 é "coroa"
close(hh)

