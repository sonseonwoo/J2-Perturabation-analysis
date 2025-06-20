function plot_j2_RAAN_vs_inclination()
% Plot RAAN regression rate vs inclination for various altitudes (circular orbits)

mu     = 398600.4418;          % [km^3/s^2] Earth's gravity
Re     = 6378.1363;            % [km] Earth's radius
J2     = 1.0826269e-3;         % [-] J2 zonal harmonic
altitudes = [100, 200, 400, 600, 1000, 2000];  % [km] orbital altitudes
incl_deg  = 0:1:180;           % [deg] inclination sweep

figure; hold on; grid on;
for alt = altitudes
    a = Re + alt;                     % semi-major axis for circular orbit [km]
    e = 0;                            % circular
    RAAN_rate = zeros(size(incl_deg));
    for k = 1:length(incl_deg)
        i_rad = deg2rad(incl_deg(k));
        RAAN_rate(k) = -1.5 * J2 * sqrt(mu) * Re^2 / (a^(7/2)) * cos(i_rad); % [rad/s]
    end
    RAAN_rate = rad2deg(RAAN_rate) * 86400;   % [deg/day]
    plot(incl_deg, RAAN_rate, 'DisplayName', sprintf('%dkm', alt));
end
xlabel('inclination (deg)'); ylabel('nodal regression (deg/day)');
title('\Omega regression vs inclination');
legend('Location','northwest');
end
