function main2
    file_path = '../resource/clip.mp3';
    [y,~] = audioread(file_path);
    len = 240;
    beg_idx = 18000;
    end_idx = beg_idx+len-1;
    ysp = y(beg_idx:end_idx); 
    t = 0:len-1;
    p = 12;
    
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
    
    L = cholesky_decomp(c);
    opts.LT = true; 
    opts.UT = false;
    tmp = linsolve(L, b,opts);
    opts.LT = false;
    opts.UT = true;
    a = linsolve(L',tmp, opts);
    
    est = zeros(1, len);
    for n = beg_idx : end_idx
        tmp = 0;
        for j = 1:p
            tmp = tmp + a(j) * y(n-j);
        end
        est(n-beg_idx+1) = tmp;
    end

    plot(t, ysp)
    xlabel('Time')
    ylabel('Audio Signal')
    hold on
    plot(t, est)
    legend('Original','Predicted')
    hold off
end
