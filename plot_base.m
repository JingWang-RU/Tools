function plot_fig = plot_base(data_matrix, xval, lineshape, colors, linew,  ymin, ymax, ...
    xmin, xmax,  xfsize, yfsize, xlab, ylab, methods, ind_method, location,legfsize)
% created by Jing Wang (jw998@rutgers.edu)
% function: plot figures
plot_fig = figure ;
box on;
grid on;    
hold on;
for i = 1:length(ind_method)
    plot(xval,data_matrix(ind_method(i), :),lineshape{ind_method(i)}, 'Color', colors{ind_method(i)}, 'LineWidth', linew);
end
set(gca,'XTick', xval,'FontSize',xfsize);
set(gca,'YTick', yval,'FontSize',yfsize);
xlim([xmin xmax]);
ylim([ymin  ymax]);
xlabel(xlab,'FontSize',legfsize+5);
ylabel(ylab,'FontSize',legfsize+5);
legend(methods(ind_method), 'Location', location,'FontSize',legfsize);