function plot_J2_COE_evolution()
% =========================================================================
% Title    : J2 COE Evolution Plotter
% Purpose  : Visualize how orbital elements (COE) change over time
%            under J2 perturbation
% Author   : Seonwoo Son
% Created  : 2023-07-31
% Updated  : 2025-06-20
% =========================================================================

%% --- Constants & Initial COE ---
C = constants();
coe = struct('a', C.Re+100, ...     % Altitude 100 km
             'e', 0.001, ...
             'i', 10, ...           % Inclination 10 deg
             'Om', 300, ...         % RAAN
             'w', 40, ...           % Argument of Perigee
             'nu', 0);              % True Anomaly

%% --- Propagation Time ---
tspan = [0, 86400];   % 1 day in seconds
out = runJ2Prop(coe, tspan);    % Numerical propagation
COE = out.COE;
T   = out.T;

%% --- Plot Each Element ---
figure('Name','J2 COE Evolution','Color','w');
tiledlayout(3,2)

nexttile
plot(T, COE(1,:)); grid on
xlabel('Time [s]'); ylabel('a [km]')
title('Semi-Major Axis Change in time')

nexttile
plot(T, COE(2,:)); grid on
xlabel('Time [s]'); ylabel('e [-]')
title('Eccentricity Change in time')

nexttile
plot(T, COE(3,:)); grid on
xlabel('Time [s]'); ylabel('i [deg]')
title('Inclination Change in time')

nexttile
plot(T, COE(4,:)); grid on
xlabel('Time [s]'); ylabel('\Omega [deg]')
title('RAAN Change in time')

nexttile
plot(T, COE(5,:)); grid on
xlabel('Time [s]'); ylabel('\omega [deg]')
title('Argument of Periapsis Change in time')

nexttile
plot(T, COE(6,:)); grid on
xlabel('Time [s]'); ylabel('\nu [deg]')
title('True Anomaly Change in time')

end