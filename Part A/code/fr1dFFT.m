% 2-D DFT through 2x 1-D FFTs
function y = fr1dFFT(X)

% Get dimensions of input(=output) image
[xdim, ydim, zdim] = size(X);
y = zeros(xdim, ydim, zdim);

for z = 1 : zdim
    % FFT on the x-axis
    for i = 1 : xdim
        y(i,:,z) = fft(X(i,:,z));
    end
    
    % FFT on the y-axis
    for i = 1 : ydim
        y(:,i,z) = fft(y(:,i,z));
    end
end

end