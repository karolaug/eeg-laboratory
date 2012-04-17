%This file computes the energy and average energy across all trials and saves
%them in separate files. Plots average energy


clear
close all
%load /home/suffa/Mfiles/SupiMfiles/data/12_01_1/spikes
%load /home/suffa/Mfiles/SupiMfiles/data/12_01_1/Characterize_ch6_F50_G4
load Characterize_ch4_F50_G4

%load /home/suffa/Mfiles/SupiMfiles/data/13_02_1/spikes
%load /home/suffa/Mfiles/SupiMfiles/data/13_02_1/Characterize_ch4_F50_G4

Fs_original = 5000;
decim_factor = 5;
NoTrials = min(size(X));
%trialNum=10; %between 1 and 50

X = X';
for i = 1:NoTrials
    Xd(:,i) = decimate(X(:,i), decim_factor);
end

Fs =  Fs_original/decim_factor;
%L = max(size(Xd(:,trialNum)));
%t  = (0:L-1)/Fs-1;
%f = 0:Fs/L:Fs/2;

%figure
%plot(t,Xd(:,trialNum)); %plotting signal

%hold on
%N = size(spikes{1,trialNum});
%times = spikes{1,trialNum};

%X_times = [ones(size(times))*times'];
%X_times_short = X_times(1:2,:);

%plot(X_times_short ,[-1 1], 'r-')  %plotting spikes


%axis([-1 2 -1 1])

%title(['lfp and spikes trial: ' num2str(trialNum)]); 
%xlabel('Time (s)');




%MP decomposition

%each lfp centered on single spike is represented in a matrix as a trial

%XM(1:2048,1,1) = Xd(1:2048,1);  - %Matrix according to Supi format, truncated to have 2048 point
%XM(1:2048,1:50,1) = Xd(524:2571,1:50);
Xd = reshape(Xd(524:2571,1:50), 2048, 50, 1);

LM = max(size(Xd))
tM  = (0:LM-1)/Fs - 0.524; % - 0.150 + 20/Fs;     % offset due 524 samples shift at truncation
fM = 0:Fs/LM:Fs/2;

f = [50   100    200   250   350    60    120  180      240    300   360   420   225];
df =[0.2  0       0    0       0    0.2    0.2  0.2     0.2     0     0    0.2    0];
Xd = removesines(Xd, Fs, f ,df );

importData(Xd, '.', 'data/',  [1 LM], Fs, 1)

runGabor('.', 'data/', LM, 100)
   
gaborInfo{1} = getGaborData('.','data/', 1);

wrap=1;
atomList=[]; % all atoms


for trialNum = 1:NoTrials

trialNum
    
gaborInfo{1}{trialNum}.gaborData = removeAtomsMPP(gaborInfo{1}{trialNum}.gaborData, LM, Fs);


%signal reconstruction
%rSignal1(trialNum) = reconstructSignalFromAtomsMPP(gaborInfo{1}{trialNum}.gaborData, LM, wrap, atomList);


%eneregy reconstruction
rEnergy(:,:,trialNum) = reconstructEnergyFromAtomsMPP(gaborInfo{1}{trialNum}.gaborData, LM, wrap, atomList);

end
save rEnergy_all rEnergy 

avg_Energy = sum(rEnergy, 3)/NoTrials; %sum along dim 3

save average_Energy avg_Energy

figure
%trialNum = 5;
%subplot(411);
%plot(tM, Xd(:,trialNum,1)); 
%title(['trial: ' num2str(trialNum)]); xlabel('Time (s)');
%axis tight
%axis([-0.025 0.025 -0.6 0.6])

%subplot(412);
%plot(tM,rSignal1,'k');
%title('Reconstruction'); xlabel('Time (s)');
%axis([-0.025 0.025 -0.6 0.6])

%axis tight

%looking for minimum of energy greater that zero
%minE = min(rEnergy1(rEnergy1>0))

%replacing zero energy with minE value

minE = 1e-6
K = find(avg_Energy< minE);
avg_Energy(K) = minE;


%subplot(4,1, [3 4]);

pcolor(tM,fM,log(avg_Energy)); shading interp;

xlabel('Time (s)'); ylabel('Frequency (Hz)');

axis tight
