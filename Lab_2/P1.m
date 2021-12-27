Njogadas=100;
NMC =7; %Número de runs
Ndiscard=0;
Ncasas=0;
z = zeros(NMC,7); %número de estados do jogo, que indica o número de vezes que se caiu em cada casa
y = zeros(1,Njogadas); % dimensão igual ao número de jogadas em cada run de Monte Carlo, que indica as casas em que se caiu em cada jogada
Aluguer = [10,10,0,15,20,25,0,35];
estados = [2,3,4,5,6,3,1;3,4,5,6,3,7,2];

for i=1:1:NMC
    x = 1; %variável escalar que indica o número do estado em que a marca do jogador está em cada instante;
    for k=1:1:Njogadas
        z(i,x) = z(i,x)+1;
        avanca = randi([1 2]);
        x = estados(avanca,x);
        y(1,k) = x;
    end 
    z(i,x) = z(i,x)+1;
    
end
%to do: pág 7 do pdf
bar(z)