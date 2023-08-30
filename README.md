# CTuNLM_Image-Denoising
Multi-scale based Approach for Denoising Real-World noisy image using Curvelet Thresholding: Scope &amp; Beyond [**The code implemented and tested in MATLAB@2022 will be available Soon....**]

##**Abstract:** <br />
Na¨ive simulated additive white Gaussian noise (AWGN) may not fully characterize the complexity of real world noisy images. Moreover, the lack of enough realistic reference image data for evaluating image denoising techniques, the results presented with synthesized Gaussian noise may exhibit limited performance on real noisy photographs. Owing to optimal sparsity in image representation, we propose a three scale based Curvelet model for decomposing image into different feature components for denoising multi-channel real-noisy images. Initially, the image is decomposed in three Curvelet scales, namely: the approximation scale, the coarser scale and the finest scale. Concurrently, the approximation and the finest scale are filtered with fast non-local means filter, while the courser scale coefficients are thresholded at different orientations to obtain denoised coefficients in Curvelet domain. The reconstructed image is further processed using Guided Image Filter (GIF) to suppress the ringing artifacts due to curvelet thresholding (sudden jump in coefficient magnitudes exhibits Gibbs phenomena). A simple but this elegant approach is extended to color image denoising by applying the algorithm independently to each channel of uncorrelated color space in YUV instead of RGB. The results are compared with several state-of-theart methods including deep learning based approaches to investigate the efficacy of the proposed approach for images corrupted with natural noises. With four encouraging quantitative and qualitative measuring indices, the scope of the proposed image denoising model is further examined to obtain for improvement in retaining maximum latent image features. In a pilot work we studied “The Curious Case of the Finest Scale” to develop a Curvelet based deep learning model known as “DeepCurvelet-Net”: to progress beyond Curvelet thresholding.

##**Problem Formulation:** <br />
![L2Formulation](https://github.com/susant146/CTuNLM_Image-Denoising/assets/128124615/bdc5230d-de64-470e-8120-be427a6a1091) The two denoised images have the same ‘l_2-distance
to the clean image, but only the denoised image lying on the path between the noisy image and the clean image contains no new artifacts.
