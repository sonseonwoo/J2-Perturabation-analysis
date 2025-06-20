function dXdt = rhs_J2(~, X, P)

    % -------- Default parameters ---------------------------------------
    if ~isfield(P,'mu'),  P.mu  = 398600.4418;     end  % km^3/s^2
    if ~isfield(P,'Re'),  P.Re  = 6378.1363;       end  % km
    if ~isfield(P,'J2'),  P.J2  = 1.0826269e-3;    end

    r_vec = X(1:3);   v_vec = X(4:6);
    r_norm = norm(r_vec);
    x = r_vec(1);  y = r_vec(2);  z = r_vec(3);

    % --- Two‑body central gravity -------------------------------------
    a_grav = -P.mu / r_norm^3 * r_vec;

    % --- J2 perturbation (gravity potential degree‑2) ------------------
    Re2 = P.Re^2;
    z2  = z^2;   r2 = r_norm^2;   r5 = r_norm^5;
    factor = -1.5 * P.J2 * P.mu * Re2 / r5;

    a_J2 = factor * [ x*(1 - 5*z2/r2);
                       y*(1 - 5*z2/r2);
                       z*(3 - 5*z2/r2) ];

    % --- Derivative -----------------------------------------------------
    dXdt = [v_vec;
            a_grav + a_J2];
end