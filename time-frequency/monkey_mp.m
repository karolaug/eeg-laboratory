%malpa
addpath('/home/karolaug/Work/MP/');
addpath('/home/karolaug/Work/MP/viewData/');
%import malpa

%signal = importdata('Characterize_ch4_F50_G4.mat');
load 'data/Characterize_ch4_F50_G4.mat'
signal = X';
clear X;
%signal = reshape(signal,max(size(signal)), 50, 1);
size(signal)
for i=1:50,
    signal2(:,i) = decimate(signal(:,i), 5);
end
signal = signal2(501:2548,:,1);
clear signal2;
f = [50   100    200   250   350    60    120  180      240    300   360   420   225];
df =[0.2  0       0    0       0    0.2    0.4  0.6     0.2     0.3     0    0.2    0];
signal = removesines(signal, 500, f ,df );




importData(signal, '../../mp_test/', 'malpa', [1 2048], 1000, 1);
runGabor('../../mp_test/', 'malpa', 2048, 100);

gaborInfo = getGaborData('../../mp_test','malpa', 1);
sumEnergy = zeros(1025, 2048, 50);
for i=1:50,
    gaborInfo{i}.gaborData = removeAtomsMPP(gaborInfo{i}.gaborData, 2048, 500);
    sumEnergy(:,:,i) = reconstructEnergyFromAtomsMPP(gaborInfo{i}.gaborData,2048,1,[]);
end





sumEnergy = sum(sumEnergy,3)/50;
sumEnergy = squeeze(sumEnergy);

meanEnergy = mean(sumEnergy(:,256:512),2);
size(meanEnergy)
for i=1:2048,
    sumEnergy(:,i) = sumEnergy(:,i) - meanEnergy;
end;


minE = 1e-6;
K = find(sumEnergy < minE);
sumEnergy(K) = minE;

f = 0:(1000/2048):500;
t = (0:2048-1)/1000;




size(sumEnergy)

pcolor(t(256:1792),f,log(sumEnergy(:,256:1792))); shading interp;
xlabel('Time (s)'); ylabel('Frequency (Hz)');
