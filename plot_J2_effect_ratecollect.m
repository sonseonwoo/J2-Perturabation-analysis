%% =========================================================================
% Script: J2_Perturbation_Rate_Analysis.m
% Purpose: Compute & visualize J2-induced RAAN and AoP rate vs inclination
% Based on: Vallado, *Fundamentals of Astrodynamics and Applications*, 5th ed.
% Method: Numerical propagation + linear fit approximation of Ω̇, ω̇ (deg/day)
% Original Creation: 2023-07-31 (Summer23_Week4)
% Updated: 2025-06-20 by Seonwoo Son
% =========================================================================

% 수집
GRID = collectRateGrid([100, 200, 400, 600, 1000, 2000], 0:5:180, [0 3*86400]);

% 플롯 - RAAN 변화율 vs 경사각 
figure; hold on; grid on
for a = 1:length(GRID.alt)
    plot(GRID.inc, GRID.Om(a,:), 'DisplayName', sprintf('%dkm', GRID.alt(a)));
end
xlabel('Inclination [deg]');
ylabel('RAAN rate [deg/day]');
title('Nodal Regression vs Inclination');
legend;


% 플롯 - AoP 변화율 vs 경사각
figure; hold on; grid on
for a = 1:length(GRID.alt)
    plot(GRID.inc, GRID.w(a,:), 'DisplayName', sprintf('%dkm', GRID.alt(a)));
end
xlabel('Inclination [deg]');
ylabel('AoP rate [deg/day]');
title('Perigee Rotation Rate vs Inclination');
legend;