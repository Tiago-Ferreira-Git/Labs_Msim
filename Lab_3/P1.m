clear
close all;
open_system('P2');
set_param('P2', 'ZeroCrossAlgorithm','Adaptive');

%Encontrar a cena do zeno do P1
% set_param('P2', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P2', 'StopTime','25');
warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');
out=sim('P2', 'SaveTime', 'on', 'SaveState', 'on');
ti=out.tout;
xi=out.z;

figure
Tfinal=25;
axis([0 Tfinal 0 25])
hold on
curve=animatedline;
set(gca,'Xlim',[0 Tfinal])
for ii=1:length(xi.Time)
 addpoints(curve,xi.Time(ii),xi.data(ii));
 drawnow
 pause(0.01)
end
hold off
