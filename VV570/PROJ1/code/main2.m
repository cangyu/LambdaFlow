function main2
    x = 2:2:50;
    y = zeros(1, length(x));
    
    for idx = 1:length(x)
        error = lpc_covariance(x(idx));
        y(idx) = norm(error,2);
    end
    
    y = log(y);
    plot(x, y);
    xlabel('p');
    ylabel('log(||e||)');
    
end

function[err] = lpc_covariance(p)
    %提取音频数据
    file_path = '../resource/clip.mp3';
    [y,~] = audioread(file_path);
    len = 120;
    beg_idx = 18000;
    end_idx = beg_idx+len-1;
    ysp = y(beg_idx:end_idx); 
    t = 0:len-1;
    
    %构造系数矩阵
    c = zeros(p, p);
    b = zeros(p, 1);
    for i = 1:p
        b(i) = calc_covariance(y, beg_idx, end_idx, 0, i);
        for j = 1:i
            tmp = calc_covariance(y, beg_idx, end_idx, j, i);
            c(i, j) = tmp;
            c(j, i) = tmp;
        end
    end
    
    %通过Cholesky分解求线性预测系数
    L = cholesky_decomp(c);
    opts.LT = true; 
    opts.UT = false;
    tmp = linsolve(L, b,opts);
    opts.LT = false;
    opts.UT = true;
    a = linsolve(L',tmp, opts);
    
    %估算
    est = zeros(1, len);
    for n = beg_idx : end_idx
        tmp = 0;
        for j = 1:p
            tmp = tmp + a(j) * y(n-j);
        end
        est(n-beg_idx+1) = tmp;
    end

    err = abs(est - ysp);
    
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
    fn = sprintf('../pic/covariance_err_%d_%d', len, p);
%     saveas(gcf,fn,'eps');
end
