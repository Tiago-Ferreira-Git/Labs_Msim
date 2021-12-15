a = 0.09;
Kt = 10;
b = 1;

h = 1;
%pre-alocar o vetor
V = zeros(1, 100);
%condição inicial
V(1) = 1;

for ll = 1:10
    u = p2(3,100,ll);
    for k = 1:length(V)-1
       V(k+1) = V(k) + h*(a*V(k)*(1-V(k)/Kt) - b*u(k)*V(k));
    end
    figure(ll)
    plot(0:length(V)-1, V)
end


