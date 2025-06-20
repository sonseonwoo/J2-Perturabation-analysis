function OUT = runJ2Prop(coe, tspan)
%--------------------------------------------------------------
if numel(tspan)==1                     % <-- 수정: 스칼라 → [0 tf]
    tspan = [0 tspan];
end
%--------------------------------------------------------------

C = constants();                           % <- mu, Re, J2 등을 반환한다고 가정
[r,v] = COE2RV(coe.a,coe.e,coe.i,coe.Om,coe.w,coe.nu, C.mu);
rv0 = [r;v];
P = struct('mu', C.mu, 'J2', C.J2, 'Re', C.Re);

opt = odeset('RelTol',1e-9,'AbsTol',1e-9);
[T,X] = ode45(@(t,x) rhs_J2(t,x,P), tspan, rv0, opt);

for k = 1:numel(T)
    COE(:,k) = RV2COE(X(k,:), C.mu);   % mu 전달
end

OUT.T=T; OUT.X=X; OUT.COE=COE; OUT.coe0=coe;

end
