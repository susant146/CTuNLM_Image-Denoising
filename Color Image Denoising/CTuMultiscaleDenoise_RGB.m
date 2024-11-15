% -------- Image denoising using Proposed Algorithm ----------
% Transform noisy image in curvelet domain: Decompose image in one scale
% i.e. nscales = 3, with coefficients in finer scale and Approximation 
% Coefficient.
% Apply non-local means filter in approximation and finer scale to retain
% edges (remove Grannular artifacts) and to reduce ringing artifactes.
% Apply threshold in the coefficients in coarser scales ---
% ------------------------
% Input: noisy_im = Corrupted image in RGB space. (Additive, zero mean)
% Output: rest_im = Restored image.
% ------------------------------------------------
% SEE ALSO: CTu_MultiscaleDenoise_Color.m
% For natural image noises increase the sigma_Y = sigma_Y*3, sigma_U = sigma_U*8 
% sigma_V = sigma_V*8
% ----------------------------------------------------------------------

function [rest_im] = CTuMultiscaleDenoise_RGB(noisy_im, sigma)

% Convert it into YUV space ----------
noisyim_yuv = rgb2yuv(noisy_im);
% Y - Channel
[~,~,~,cD1] = waved(noisyim_yuv(:,:,1), 1, 'db8');
sigma_Y = median(abs(cD1(:)))/0.6745;
rest_imYUV(:,:,1) = CTuMultiscaleDenoise_Color(noisyim_yuv(:,:,1), sigma_Y, 3);
rest_imYUV(:,:,1) = imguidedfilter(rest_imYUV(:,:,1), 'NeighborhoodSize', 5, 'DegreeOfSmoothing', 1.2);
% U - Chyannel
[~,~,~,cD2] = waved(noisyim_yuv(:,:,2), 1, 'db8');
sigma_U = median(abs(cD2(:)))/0.6745;
rest_imYUV(:,:,2) = CTuMultiscaleDenoise_Color(noisyim_yuv(:,:,2), sigma_U, 3);
rest_imYUV(:,:,2) = imguidedfilter(rest_imYUV(:,:,2), 'NeighborhoodSize', 5, 'DegreeOfSmoothing', sigma_U*10);
% V - Channel
[~,~,~,cD3] = waved(noisyim_yuv(:,:,3), 1, 'db8');
sigma_V = median(abs(cD3(:)))/0.6745;
rest_imYUV(:,:,3) = CTuMultiscaleDenoise_Color(noisyim_yuv(:,:,3), sigma_V, 3);
rest_imYUV(:,:,3) = imguidedfilter(rest_imYUV(:,:,3), 'NeighborhoodSize', 5, 'DegreeOfSmoothing', sigma_V*10);

% Convert back to RGB scpace ---
rest_im = yuv2rgb(rest_imYUV);
if sigma >= 10
    rest_im = imguidedfilter(rest_im, 'NeighborhoodSize', 5, 'DegreeOfSmoothing', sigma);
end

end
