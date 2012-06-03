function draw_10_20_one(data, t, y_lim)
    subplot(5,7,3);
    plot(t, data(1,:));
    ylim(y_lim);
    title('Fp1')
    subplot(5,7,5);
    plot(t, data(2,:));
    ylim(y_lim);
    title('Fp2')
    subplot(5,7,9);
    plot(t, data(3,:));
    ylim(y_lim);
    title('F7')
    subplot(5,7,10);
    plot(t, data(4,:));
    ylim(y_lim);
    title('F3')
    subplot(5,7,11);
    plot(t, data(5,:));
    ylim(y_lim);
    title('Fz')
    subplot(5,7,12);
    plot(t, data(6,:));
    ylim(y_lim);
    title('F4')
    subplot(5,7,13);
    plot(t, data(7,:));
    ylim(y_lim);
    title('F8')
    subplot(5,7,15);
    plot(t, data(20,:));
    ylim(y_lim);
    title('A1')
    subplot(5,7,16);
    plot(t, data(8,:));
    ylim(y_lim);
    title('T3')
    subplot(5,7,17);
    plot(t, data(9,:));
    ylim(y_lim);
    title('C3')
    subplot(5,7,18);
    plot(t, data(10,:));
    ylim(y_lim);
    title('Cz')
    subplot(5,7,19);
    plot(t, data(11,:));
    ylim(y_lim);
    title('C4')
    subplot(5,7,20);
    plot(t, data(12,:));
    ylim(y_lim);
    title('T4')
    subplot(5,7,21);
    plot(t, data(21,:));
    ylim(y_lim);
    title('A2')
    subplot(5,7,23);
    plot(t, data(13,:));
    ylim(y_lim);
    title('T5')
    subplot(5,7,24);
    plot(t, data(14,:));
    ylim(y_lim);
    title('P3')
    subplot(5,7,25);
    plot(t, data(15,:));
    ylim(y_lim);
    title('Pz')
    subplot(5,7,26);
    plot(t, data(16,:));
    ylim(y_lim);
    title('P4')
    subplot(5,7,27);
    plot(t, data(17,:));
    ylim(y_lim);
    title('T6')
    subplot(5,7,31);
    plot(t, data(18,:));
    ylim(y_lim);
    title('O1')
    subplot(5,7,33);
    plot(t, data(19,:));
    ylim(y_lim);
    title('O2')
