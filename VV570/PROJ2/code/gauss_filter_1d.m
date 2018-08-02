function y_filtered = gauss_filter_1d(y, sigma, r)
    gauss_template =ones(1,2*r-1);
    for i =1:length(gauss_template)
        gauss_template(i) = exp(-(i-r)^2/(2*sigma^2))/(sigma*sqrt(2*pi));
    end
    
    y_filtered = y;
    for i = r : length(y)-r
        y_filtered(i) = y(i-r+1 : i+r-1)*gauss_template';
    end
end
