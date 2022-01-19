clear
close all;
open_system('P1_sim');
set_param('P1_sim', 'ZeroCrossAlgorithm','Adaptive');

%Encontrar a cena do zeno do P1
%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P1_sim', 'StopTime','25');
warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');
out=sim('P1_sim', 'SaveTime', 'on', 'SaveState', 'on');
ti=out.tout;
xi=out.z;

figure
Tfinal=25;
axis([0 Tfinal 0 12])
hold on
curve=animatedline;
set(gca,'Xlim',[0 Tfinal])
for ii=1:length(xi.Time)
 addpoints(curve,xi.Time(ii),xi.data(ii));
 drawnow
 pause(0.01)
end
hold off
