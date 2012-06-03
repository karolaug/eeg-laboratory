clear all
h = '/home/karolaug/Work/';
hjorth = 0;
if hjorth == 0,
    load([h 'eeg-laboratory/erd-ers/movement/data_epochs_mu_and_beta.mat']);
else
    load([h 'eeg-laboratory/erd-ers/movement/data_epochs_mu_and_beta_hjorth.mat']);
end
load([h 'eeg-laboratory/erd-ers//movement/others.mat']);

data_beta = data_beta.^2;
data_mu = data_mu.^2;

data_beta = squeeze(mean(data_beta,1));
data_mu = squeeze(mean(data_mu,1));

ref_beta = mean(data_beta(:,1*info.fs:3*info.fs),2);
ref_mu = mean(data_mu(:,1*info.fs:3*info.fs),2);

data_beta = bsxfun(@minus, data_beta, ref_beta);
data_mu = bsxfun(@minus, data_mu, ref_mu);
data_beta = bsxfun(@(x,y) x./y, data_beta, ref_beta);
data_mu = bsxfun(@(x,y) x./y, data_mu, ref_mu);

for i=1:21,
    data_beta(i,:) = conv(data_beta(i,:), ones(150, 1), 'same');
    data_mu(i,:) = conv(data_mu(i,:), ones(150, 1), 'same');
end

clear t
t = linspace(-5, 5, length(data_beta));

clear ref_beta ref_mu

if hjorth == 0,
    draw_10_20(data_mu, data_beta, t, [-100,100]);
else
    subplot(3,1,1)
    plot(t, data_mu(9,:), t, data_beta(9,:))
    ylim([-100, 100])
    title('C3')
    subplot(3,1,2)
    plot(t, data_mu(10,:), t, data_beta(10,:))
    ylim([-100, 100])
    title('Cz')
    subplot(3,1,3)
    plot(t, data_mu(11,:), t, data_beta(11,:))
    ylim([-100, 100])
    title('C4')
end