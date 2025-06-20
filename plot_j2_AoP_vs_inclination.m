function plot_j2_AoP_vs_inclination()
% Plot AoP (argument of perigee) regression rate vs inclination
% Assumes constant perigee altitude, varying apogee altitude

mu     = 398600.4418;         % [km^3/s^2]
Re     = 6378.1363;           % [km]
J2     = 1.0826269e-3;        % [-]

rp = Re + 100;                % Constant perigee altitude [km]
apogee_alts = [100, 500, 1000, 2000, 3000, 4000];  % [km]

incl_deg = 0:1:180;

figure; hold on; grid on;
for ha = apogee_alts
    ra = Re + ha;
    a = (rp + ra) / 2;        % semi-major axis
    e = (ra - rp) / (ra + rp);
    p = a * (1 - e^2);
    AoP_rate = zeros(size(incl_deg));
    for k = 1:length(incl_deg)
        i_rad = deg2rad(incl_deg(k));
        AoP_rate(k) = 0.75 * J2 * sqrt(mu) * Re^2 / (p^2 * a^(3/2)) * (5*cos(i_rad)^2 - 1); % [rad/s]
    end
    AoP_rate = rad2deg(AoP_rate) * 86400;  % convert to deg/day
    plot(incl_deg, AoP_rate, 'DisplayName', sprintf('%dkm', ha));
end

xlabel('inclination (deg)');
ylabel('perigee rotation (deg/day)');
title('\\omega regression vs inclination');
legend('Location','north');
end
