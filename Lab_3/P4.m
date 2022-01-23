clear
close all;
open_system('P4_sim');

warning('off', 'Simulink:Solver:ZeroCrossingNotBracketedDueToSmallSignalValues');

%set_param('P1_sim', 'ZeroCrossAlgorithm','Nonadaptive');

set_param('P4_sim', 'ZeroCrossAlgorithm','Adaptive');
set_param('P4_sim', 'StopTime','25');
set_param('P4_sim/coef_rest_chao','Gain', '-0.85');
set_param('P4_sim/coef_rest_parede','Gain', '-0.7');
set_param('P4_sim/d_parede','Value', '10');
set_param('P4_sim/v0_z','Value','0');
set_param('P4_sim/v0_y','Value','2');
set_param('P4_sim/z0','Value','10');
set_param('P4_sim/y0','Value','0');

out=sim('P4_sim', 'SaveTime', 'on', 'SaveState', 'on');    
ti = out.tout;
zi = out.z;
yi = out.y;
check = out.check;
figure(1)
plot(yi.data,zi.data);
legend('Trajectória')
axis([0 25 0 12])
xlabel('Y [m]')
ylabel('Z [m]')


figure(2)
plot(zi.Time,zi.data);
axis([0 16 0 14])
pause(0.1)
ylabel('Z [m]')
xlabel('Tempo [s]')

figure(3)
plot(yi.Time,yi.data);
axis([0 16 -10 14])
pause(0.1)
ylabel('Y [m]')
xlabel('Tempo [s]')

figure(4)
plot(check);
axis([0 16 0 14])
pause(0.1)





