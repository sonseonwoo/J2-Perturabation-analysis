function fig = plotRateVsInc(GRID, field, ylabTxt)
clr = lines(numel(GRID.alt));
figure; hold on; grid on
for k = 1:numel(GRID.alt)
    plot(GRID.inc, GRID.(field)(k,:), ...
         'Color',clr(k,:), 'LineWidth',1.3, ...
         'DisplayName',sprintf('%dkm',GRID.alt(k)));
end
xlabel('inclination (deg)')
ylabel(ylabTxt); legend show; fig=gcf;
end
