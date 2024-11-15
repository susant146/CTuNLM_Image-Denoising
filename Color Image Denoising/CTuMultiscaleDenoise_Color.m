% ------- Image denoising via curvelet (USFFT) thresholding. ------------
% Threshold is selected using complex conjugate multiplication of curevelt
% coefficients at each scale.
% ----------------------------------------------------------------------

function [Restored_Img] = CTuMultiscaleDenoise_Color(Noisy_Im, sigma, nscale) 

Noisy_Im = double(Noisy_Im);
n = size(Noisy_Im,1);        
is_real = 0;

% Compute FDCT of Noise....
randn('seed', 0);
X = randn(n);
C = fdct_usfft(X,is_real,nscale);
% C_im = fdct_usfft(nir_im, is_real, nscale);
% Compute norm of curvelets (Monte Carlo) 
% E = Estimated Sigma at Each Lavel (Est_Sigma).
E = cell(size(C));

 for s=1:length(C)
   E{s} = cell(size(C{s}));
   for w=1:length(C{s})
    A = C{s}{w};
    E{s}{w} = sqrt(sum(sum(A.*conj(A))) / numel(A));
   end
 end
 
 % Take curvelet transform of Noisy Image: fdct_usfft
C = fdct_usfft(Noisy_Im,is_real,nscale);
Ct = C;
% Apply NLM Filter in Approximation Coefficient ---- 
if sigma <= 10
    k = 1.5;
    k1 = 0.2;
    k2 = 0.5;
    % Apply Non_Local Means Filter -------------
    Options.filterstrength=(sigma)*k1;
    Options.kernelratio=3;
    Options.windowratio=5;
    Options.verbose=false;
    Ct{1}{1} = NLMF(C{1}{1}, Options);
else
    k = 1.5;
    k1 = 0.7; % k1 = 0.7
    k2 = 0.65;
    % Apply Non_Local Means Filter -------------
    Options.filterstrength=(sigma)*k1;
    Options.kernelratio=4;
    Options.windowratio=5;
    Options.verbose=false;
    Ct{1}{1} = NLMF(C{1}{1}, Options);
end
% Ct{1}{1} = imguidedfilter(C{1}{1}, C_im{1}{1}, 'NeighborhoodSize', 5, 'DegreeOfSmoothing', 1.2);

% Apply thresholding
for s = 2:length(C)
  thresh = k*sigma;         
  for w = 1:length(C{s})
      C_angle = C{s}{w}./abs(C{s}{w});
      Ct_Coeff = C{s}{w}.*(abs(C{s}{w}) > thresh*E{s}{w});
      Ct_abs = abs(Ct_Coeff);
      Ct_absEst = imguidedfilter(Ct_abs, abs(C{s}{w}), 'NeighborhoodSize', 5, 'DegreeOfSmoothing', 0.01);
      Ct{s}{w} = Ct_absEst.*C_angle;
  end
end

% Apply NLM filter in the first scale ----
C1_Current = C{length(C)}{1};
Options1.filterstrength=(sigma)*k2;
Options1.kernelratio=4;
Options1.windowratio=5;
Options1.verbose=false;
% Ct{length(C)}{1} = C_im{length(C)}{1};
Ct{length(C)}{1} = NLMF(C1_Current, Options1);
% Ct{length(C)}{1} = CTu_MultiscaleDenoise_NLM(C1_Current, 1.2*sigma, nscale);
% Ct{length(C)}{1} = Run_PLPCA(C1_Current, sigma);
% Ct{length(C)}{1} = imguidedfilter(Ct{length(C)}{1}, 'NeighborhoodSize', 5, 'DegreeOfSmoothing', sigma*0.8);

% Take inverse transform of thresholded data: ifdct_usfft
Restored_Img = real(ifdct_usfft(Ct,is_real)); 
if sigma >= 40
    epls = sigma*4;
else
    epls = sigma*2;
end
Restored_Img = imguidedfilter(Restored_Img, 'NeighborhoodSize', 5, 'DegreeOfSmoothing',epls);
 
end
