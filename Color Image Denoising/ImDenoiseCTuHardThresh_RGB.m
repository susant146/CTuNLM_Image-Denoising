% Color Image denoising using Curvelet Thresholding -----
% Input: noisy_im = Colored Noisy Image (RGB) corrupted with additive 
%                   Gaussian noise of standard deviation 'sigma'
% Output: rest_im = Restored Image.
% ----------------------------------------------------------
% SEE ALSO: Image_Denoising.m, CTu_ImDenoise_CompCongHardTh


% Ref: J.L. Starck, E. J. Candès, and D. L. Donoho, “The curvelet transform
% for image denoising,” Image Processing, IEEE Transactions on, vol. 11,
% no. 6, pp. 670–684, 2002.
% ---------------------------------------------------------------

function [rest_im] = ImDenoiseCTuHardThresh_RGB(noisy_im)
% --- Convert the image in YUV Color Space ------
noisyim_yuv = rgb2yuv(noisy_im);
restim_yuv = zeros(size(noisy_im));

% Estime noise standard deviation in each channel ---
% Y-Channel
[~,~,~,cD1] = waved(noisyim_yuv(:,:,1), 1, 'db8');
sigma_Y = median(abs(cD1(:)))/0.6745;
% U-Channel
[~,~,~,cD2] = waved(noisyim_yuv(:,:,2), 1, 'db8');
sigma_U = median(abs(cD2(:)))/0.6745;
% V-Channel
[~,~,~,cD3] = waved(noisyim_yuv(:,:,3), 1, 'db8');
sigma_V = median(abs(cD3(:)))/0.6745;

% Apply Curvelet Hard Thresholding at Each Chanel ----
restim_yuv(:,:,1) = Image_Denoising(noisyim_yuv(:,:,1), sigma_Y, 11);
restim_yuv(:,:,2) = Image_Denoising(noisyim_yuv(:,:,2), sigma_U, 11);
restim_yuv(:,:,3) = Image_Denoising(noisyim_yuv(:,:,3), sigma_V, 11);

% Convert back to RGB space ---
rest_im = yuv2rgb(restim_yuv);

end
