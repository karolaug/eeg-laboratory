function draw_assr(data, t, x_lim, y_lim)
    for i=1:24
        subplot(6,4,i)
        plot(t, data(i,:))
        title(i)
        xlim(x_lim)
        if y_lim ~= [0,0]
            ylim(y_lim)
        end
    end
