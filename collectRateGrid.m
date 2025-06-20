function GRID = collectRateGrid(altGrid, incGrid, tspan)
constants;
for a = 1:numel(altGrid)
  for i = 1:numel(incGrid)
      coe = struct('a',constants().Re+altGrid(a),...
                   'e',0.05,'i',incGrid(i),...
                   'Om',0,'w',0,'nu',0);
      out = runJ2Prop(coe, tspan);
      r   = getRates(out.COE, out.T);
      GRID.Om(a,i) = r.OmDot;
      GRID.w (a,i) = r.wDot;
  end
end
GRID.alt = altGrid; GRID.inc = incGrid;
end
