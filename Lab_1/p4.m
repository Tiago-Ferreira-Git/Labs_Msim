close all
clear

%Variaveis de controlo
max_mg = 30;
max_space = 40;

%Parametros dados
a = 0.09;
Kt = 10;
b = 1;
h = 1;

%Pre-alocar o vetor
V = zeros(max_space, 100);
spacing = zeros(1,max_mg);

%Condição inicial
V(:,1) = 1;

for ll = 1:max_mg
    %Comentar esta linha caso necessário
    figure(ll)
    
    %Loop que descobre os diferentes andamentos de volume quando o volume
    %inicial é 1mm^3 e se toma ll mg de ii dias em ii dias
    for ii = 1:max_space
        u = p2(ll,100,ii);
        for k = 1:length(V)-1
           V(ii,k+1) = V(ii,k) + h*(a*V(ii,k)*(1-V(ii,k)/Kt) - b*u(k)*V(ii,k));
        end
        plot(0:length(V(ii,:))-1, V(ii,:));
        hold on
    end
    new_min = 1000;
    
    %Loop que descobre para que valor de espaçamento se obtem 10% (ou mais
    %próximo disso) do valor inicial de volume ao fim de 25 dias
    for ii = 1:max_space
        if abs(0.1-V(ii,25)) < new_min
            new_min = abs(0.1-V(ii,25));
            index = ii;
        end
    end
    spacing(ll) = index;
    
end

figure(ll+1);
plot(1:max_mg, spacing);
axis([0 max_mg 0 min(max_space + 5,30)]);
xlabel('Dose (mg)')
%Tempo entre dosagens para que o tamanho seja 10% ao fim de 25 dias
ylabel('Spacing between doses (days)') 

