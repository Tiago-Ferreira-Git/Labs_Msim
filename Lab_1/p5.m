dosagem = 3;
%Dados do enunciado
a = 0.09;
Kt = 10;
b = 1;
h = 1;



r = randi([0 6],1,50);
%d = zeros(1,sum(r,'all'));
d = zeros(1,100);
index=0;
for i= 1:1:100
    if i < 20
        d(i) = 1;
        continue
    end
    if i < 40
        d(i) = 2;
        continue
    end
    if i < 60
        d(i) = 3;
        continue
    end
    if i < 80
        d(i) = 4;
        continue
    end
    if i <= 100
        d(i) = 5;
        continue
    end
end

% for i= 1:1:length(r)
%     index = r(i) + index;
%     d(index) = dosagem;
% end
[~,c2] = p1_vers2(0,0,dosagem,100,2,d);