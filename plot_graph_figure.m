figure;
% x=[];
% y=[];
% z=[];
% scatter3(x,y,z);

load('E:\jessica\jessica_workspace\tsmc\FaceRecognition\Data\UCI\zoo.mat');
n = 90;
Dat = abalone;
ind = [idx_class{4}(1:20); idx_class{3};idx_class{19}(1:15);idx_class{20};idx_class{21}];
% X=Dat(randperm(n),:);
X=Dat(ind,:);
Dis = sqdist(X',X');

a = Dat(ind,end);
class = unique(a);
idx_class = cell(length(class),1);
sim_class = zeros(length(class),1);
for i = 1:length(class)
    idx_class{i}=find(a==class(i));
%     sim_class(i)=1/length(idx_class{i});
end

z=Dis;
nn=3;
val = zeros(n,n);
pos = zeros(n,n);
for i = 1:nn
    [val(:,i),pos(:,i)] = min(Dis,[],2);
    tep = (pos(:,i)-1)*n+[1:n]';
    Dis(tep) = 1e60; 
end

for i =1:n
    I = cellfun(@(x) find(x==i), idx_class, 'UniformOutput', false);
    idx =  find(~cellfun('isempty',I));
    sam_idx  = idx_class{idx};
    dif_class_idx = setdiff(1:n, sam_idx);
    z(i,dif_class_idx) = 0;  
    [~,id]=sort(z(i,:));
    z(i,id(1:n-nn))=0;
    end
for i =1:n
    [~,id]=sort(z(i,:));
    z(i,id(1:n-nn))=0;
end

n=90;nn=8;
for i =1:n
    [~,id]=sort(z(i,:));
    z(i,id(1:n-nn))=0;
end
for i = 1:n
for j = i+1:n
z(j,i)=z(i,j);
end
end

z = roundn(z,-4); %preserve 4 digits decimals
%% check if symmetric
for i = 1:n
    for j = i+1:n
        if z(i,j)~=z(j,i)
            fprintf(1,'%d,%d\n',i,j);
        end
    end
end
%%         matlab 2015
ind = setdiff([1:n],idx{2});
a=z;
a(ind,:)=[];
a(:,ind)=[];
G=graph(a,'OmitSelfLoops');
LWidths = 0.5;
Marker='o';
MarkerSize = 10;
LineStyle = '-';
plot(G,'EdgeColor','k','LineWidth',LWidths,'NodeColor','g','LineStyle',LineStyle,...
    'Marker',Marker,'MarkerSize', MarkerSize,...
    'NodeLabel',[]);

num = 90;
theta = linspace(0,2*pi,num);
x = sin(theta) + 0.75*rand(1,num);
y = cos(theta) + 0.95*rand(1,num);
a = 90;
c = linspace(1,10,length(x));
scatter(x,y,a,c,'filled');
