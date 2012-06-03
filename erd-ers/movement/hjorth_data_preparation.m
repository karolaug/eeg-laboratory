clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/data_epochs_mu_and_beta.mat']);
load([h 'eeg-laboratory/erd-ers/others.mat']);

%C3 - T3, F3, Cz, P3
%Cz - C3, Pz, C4, Fz
%C4 - Cz, T4, P4, F4

C3_beta = data_beta(9,:) - (data_beta(8,:) + data_beta(10,:) + data_beta(4,:) + data_beta(14,:))/.4;
C3_mu = data_mu(9,:) - (data_mu(8,:) + data_mu(10,:) + data_mu(4,:) + data_mu(14,:))/.4;

Cz_beta = data_beta(10,:) - (data_beta(11,:) + data_beta(9,:) + data_beta(15,:) + data_beta(5,:))./4;
Cz_mu = data_mu(10,:) - (data_mu(11,:) + data_mu(9,:) + data_mu(15,:) + data_mu(5,:))./4;

C4_beta = data_beta(11,:) - (data_beta(10,:) + data_beta(12,:) + data_beta(16,:) + data_beta(6,:))./4;
C4_mu = data_mu(11,:) - (data_mu(10,:) + data_mu(12,:) + data_mu(16,:) + data_mu(6,:))./4;

data_mu(9,:) = C3_mu;
data_beta(9,:) = C3_beta;

data_mu(10,:) = Cz_mu;
data_beta(10,:) = Cz_beta;

data_mu(11,:) = C4_mu;
data_beta(11,:) = C4_beta;

save([h 'eeg-laboratory/erd-ers/data_epochs_mu_and_beta_hjorth.mat'], 'data_mu', 'data_beta');