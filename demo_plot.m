% demo 
% created by Jing Wang (jw998@rutgers.edu)

xval = 1:2:7;
tmp = xval;
data_matrix = [tmp; 2*tmp; 3*tmp; 4*tmp];
ind_method = [1,2,3,4];
methods = {'M1','M2','M3', 'M4'};
xlab = '# the number of instances';
ylab = 'recall';
lineshape = {'-^',':^','-o', ':o'};
colors = {'r','b','g','k'};
linew = 2.5;
xmin = min(xval);
xmax = max(xval);
ymin = min(min(data_matrix));
ymax = max(max(data_matrix));

location = 'SouthEast';
xfsize = 15;
yfsize = 20;
figh = plot_base(data_matrix, xval, lineshape, colors, linew,  ymin, ymax, ...
    xmin, xmax,  xfsize, yfsize, xlab, ylab, methods, ind_method, location);