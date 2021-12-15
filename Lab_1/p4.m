close all
clear

a = 0.09;
Kt = 10;
b = 1;

h = 1;
%pre-alocar o vetor
V = zeros(10, 100);
valores = zeros(1,10);
%condição inicial
V(:,1) = 1;

for ll = 1:10
    figure(ll)
    for ii = 1:10
        u = p2(ii,100,ll);
        for k = 1:length(V)-1
           V(ii,k+1) = V(ii,k) + h*(a*V(ii,k)*(1-V(ii,k)/Kt) - b*u(k)*V(ii,k));
        end
        plot(0:length(V(ii,:))-1, V(ii,:))
        hold on
    end
    new_max = 10;
    for ii = 1:10
        if abs(0.1-V(ii,25)) < new_max
            new_max = V(ii,25);
            index = ii;
        end
    end
    valores(ll) = index;
end
figure(2);
plot(0:length(new_max)-1, new_max);
