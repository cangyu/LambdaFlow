function main1
    %提取音频数据
    file_path = '../resource/clip.mp3';
    [y,~] = audioread(file_path);
    len = 120;
    beg_idx = 18000;
    end_idx = beg_idx+len-1;
    ysp = y(beg_idx:end_idx); 
    t = 0:len-1;
    p = 6;
    
    %求解线性预测系数
    r = zeros(1, p+1);
    for j = 1:p+1
        r(j) = calc_autocorrelation(ysp, j-1);
    end
    a = solve_toeplitz(r);
    
    %估算
    est = zeros(1, len);
    for n = beg_idx:end_idx
        tmp = 0;
        for j = 1:p
            tmp = tmp + a(j) * y(n-j);
        end
        est(n-beg_idx+1) = tmp;
    end
    
    err = abs(ysp-est);
    
    %画图
    figure(1)
    plot(t, ysp)
    xlabel('Time')
    ylabel('Audio Signal')
    hold on
    plot(t, est)
    legend('Original','Predicted')
    hold off
    
    figure(2)
    plot(t, err)
    ylim([0 0.2])
    xlabel('Time')
    ylabel('Absolute Error')
end
