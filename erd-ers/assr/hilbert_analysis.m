clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/assr/others.mat']);
load([h 'eeg-laboratory/erd-ers/assr/data_final_plain.mat']);


data_final = data_final.^2;
data_final = squeeze(mean(data_final, 1));

data_ref = data_final(:,info.fs*1:info.fs*3);
data_ref = mean(data_ref,2);

data_draw = bsxfun(@minus,data_final,data_ref);
data_draw = bsxfun(@(x,y) x./y, data_draw, data_ref);
%data_draw = data_final;
t = linspace(-5,10,length(data_draw));

for i=1:24,
    data_draw(i,:) = conv(data_draw(i,:), ones(4000,1), 'same');
end


draw_assr(data_draw, t, [-5, 10], [-100,500]);

