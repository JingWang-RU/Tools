cur_methods = {'Lap','SPEC','MCFS','Trace_unsup','SNFS','Grafting','L121','Fisher','ReliefF','Trace','MRMR','OnlineGraph'};
cur_datas = {'wdbcM','ionM','spectfM','spambaseM',...
    'colonM','prostateM','leukemiaM','lungCancerM',...
    'BASEHOCK','PCMAC','RELATHE','ALLAML','GLI_85',...
    'SMK_CAN_18','arcene','gisette','madelon'};
cur_methods_res = cell(length(cur_methods),1);
for i = 1:length(cur_methods)
    load([cur_methods{i} '_baseline.mat']);
    cur_methods_res{i} = data_accu;
end

result_set = cell(length(cur_datas),1);
max_sup_per_data = zeros(length(cur_datas),50);
max_unsup_per_data = zeros(length(cur_datas),50);
for k = 1:length(cur_datas)
    res = zeros(length(cur_methods),50);
    for j = 1:length(cur_methods)
        tmp = cur_methods_res{j};
        if j == 1
            res =  tmp(k,:);
        else
            res = [res; tmp(k,:)];
        end
    end
    result_set{k} = res;
    max_sup_per_data(k,:)=max(res(6:end,:));
    max_unsup_per_data(k,:)=max(res(1:5,:));
end
save('result_cur_methods_cur_datas.mat','cur_methods_res','cur_methods',...
    'max_unsup_per_data','max_sup_per_data','cur_datas','cur_methods','result_set');