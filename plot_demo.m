methods = {'LP','SPEC','TR','SNFS','OGFS\_UL'};
ind_method = [1,2,3,4,5];
% methods = {'M1','M2','M3', 'M4'};
xlab = '# the number of selected features (x10^3)';
ylab = 'MAP';
data_matrix = Map(:, index);
% ylab = 'Precision';
% data_matrix = Prec(:, index);
lineshape = {'-','-','-', '-','-'};
colors = {'k','b','y','g','r'};
linew = 2.5;
xval = index;
xmin = min(xval);
xmax = max(xval);
ymin = min(min(data_matrix));
ymax = max(max(data_matrix));

location = 'SouthEast';
xfsize = 11;
yfsize = 11;
legfsize = 15;
figh = plot_base(data_matrix, xval, lineshape, colors, linew,  ymin, ymax, ...
    xmin, xmax,  xfsize, yfsize, xlab, ylab, methods, ind_method, location,legfsize);