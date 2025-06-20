function R = getRates(COE, T)
    % RAAN unwrap & fit
    RAAN_unwrapped = rad2deg(unwrap(deg2rad(COE(4,:))));
    s = polyfit(T, RAAN_unwrapped, 1);
    R.OmDot = s(1) * 86400;   % deg/day

    % AoP unwrap & fit
    AoP_unwrapped = rad2deg(unwrap(deg2rad(COE(5,:))));
    s = polyfit(T, AoP_unwrapped, 1);
    R.wDot = s(1) * 86400;    % deg/day
end
