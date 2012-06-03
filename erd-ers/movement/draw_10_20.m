function draw_10_20(data1, data2, t, y_lim)
    subplot(5,7,3);
    plot(t, data1(1,:), t, data2(1,:));
    ylim(y_lim);
    title('Fp1')
    subplot(5,7,5);
    plot(t, data1(2,:), t, data2(2,:));
    ylim(y_lim);
    title('Fp2')
    subplot(5,7,9);
    plot(t, data1(3,:), t, data2(3,:));
    ylim(y_lim);
    title('F7')
    subplot(5,7,10);
    plot(t, data1(4,:), t, data2(4,:));
    ylim(y_lim);
    title('F3')
    subplot(5,7,11);
    plot(t, data1(5,:), t, data2(5,:));
    ylim(y_lim);
    title('Fz')
    subplot(5,7,12);
    plot(t, data1(6,:), t, data2(6,:));
    ylim(y_lim);
    title('F4')
    subplot(5,7,13);
    plot(t, data1(7,:), t, data2(7,:));
    ylim(y_lim);
    title('F8')
    subplot(5,7,15);
    plot(t, data1(20,:), t, data2(20,:));
    ylim(y_lim);
    title('A1')
    subplot(5,7,16);
    plot(t, data1(8,:), t, data2(8,:));
    ylim(y_lim);
    title('T3')
    subplot(5,7,17);
    plot(t, data1(9,:), t, data2(9,:));
    ylim(y_lim);
    title('C3')
    subplot(5,7,18);
    plot(t, data1(10,:), t, data2(10,:));
    ylim(y_lim);
    title('Cz')
    subplot(5,7,19);
    plot(t, data1(11,:), t, data2(11,:));
    ylim(y_lim);
    title('C4')
    subplot(5,7,20);
    plot(t, data1(12,:), t, data2(12,:));
    ylim(y_lim);
    title('T4')
    subplot(5,7,21);
    plot(t, data1(21,:), t, data2(21,:));
    ylim(y_lim);
    title('A2')
    subplot(5,7,23);
    plot(t, data1(13,:), t, data2(13,:));
    ylim(y_lim);
    title('T5')
    subplot(5,7,24);
    plot(t, data1(14,:), t, data2(14,:));
    ylim(y_lim);
    title('P3')
    subplot(5,7,25);
    plot(t, data1(15,:), t, data2(15,:));
    ylim(y_lim);
    title('Pz')
    subplot(5,7,26);
    plot(t, data1(16,:), t, data2(16,:));
    ylim(y_lim);
    title('P4')
    subplot(5,7,27);
    plot(t, data1(17,:), t, data2(17,:));
    ylim(y_lim);
    title('T6')
    subplot(5,7,31);
    plot(t, data1(18,:), t, data2(18,:));
    ylim(y_lim);
    title('O1')
    subplot(5,7,33);
    plot(t, data1(19,:), t, data2(19,:));
    ylim(y_lim);
    title('O2')
