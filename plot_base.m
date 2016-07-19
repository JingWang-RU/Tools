function plot_fig = plot_base(data_matrix, xval, lineshape, colors, linew,  ymin, ymax, ...
    xmin, xmax,  xfsize, yfsize, xlab, ylab, methods, ind_method, location)
% created by Jing Wang (jw998@rutgers.edu)
% function: plot figures
plot_fig = figure ;
box on;
grid on;    
hold on;
for i = 1:length(ind_method)
    plot(xval,data_matrix(ind_method(i), :),lineshape{ind_method(i)}, 'Color', colors{ind_method(i)}, 'LineWidth', linew);
end
set(gca,'XTick', xval);
% set(gca,'YTick');
xlim([xmin xmax]);
ylim([ymin  ymax]);
xlabel(xlab,'FontSize',xfsize);
ylabel(ylab,'FontSize',yfsize);
legend(methods(ind_method), 'Location', location);

