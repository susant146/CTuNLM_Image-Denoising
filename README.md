# CTuNLM_Image-Denoising
Multi-scale based Approach for Denoising Real-World noisy image using Curvelet Thresholding: Scope &amp; Beyond [**The code implemented and tested in MATLAB@2022 will be available Soon....**]
<br /> **Cite the follwoing papers if your using our code.** <br />
## Cite 
1. S. K. Panigrahi, S. K. Tripathy, A. Bhowmick, S. K. Satapathy, P. Barsocchi and A. K. Bhoi, "Multi-Scale Based Approach for Denoising Real-World Noisy Image Using Curvelet Thresholding: Scope and Beyond," in IEEE Access, vol. 12, pp. 25090-25105, 2024, doi: 10.1109/ACCESS.2024.3364397.. 
1. S. K. Panigrahi, S. Gupta, and P. K. Sahu, “Curvelet-based multiscale denoising using non-local means & guided image filter,” IET Image Processing, vol. 12, no. 6, pp. 909–918, 2018.
1. S. K. Panigrahi, “Image denoising by edge preserved curvelet thresholding,” Ph.D. dissertation, 2019.

## **Abstract:** <br />
Na¨ive simulated additive white Gaussian noise (AWGN) may not fully characterize the complexity of real world noisy images. Moreover, the lack of enough realistic reference image data for evaluating image denoising techniques, the results presented with synthesized Gaussian noise may exhibit limited performance on real noisy photographs. Owing to optimal sparsity in image representation, we propose a three scale based Curvelet model for decomposing image into different feature components for denoising multi-channel real-noisy images. Initially, the image is decomposed in three Curvelet scales, namely: the approximation scale, the coarser scale and the finest scale. Concurrently, the approximation and the finest scale are filtered with fast non-local means filter, while the courser scale coefficients are thresholded at different orientations to obtain denoised coefficients in Curvelet domain. The reconstructed image is further processed using Guided Image Filter (GIF) to suppress the ringing artifacts due to curvelet thresholding (sudden jump in coefficient magnitudes exhibits Gibbs phenomena). A simple but this elegant approach is extended to color image denoising by applying the algorithm independently to each channel of uncorrelated color space in YUV instead of RGB. The results are compared with several state-of-theart methods including deep learning based approaches to investigate the efficacy of the proposed approach for images corrupted with natural noises. With four encouraging quantitative and qualitative measuring indices, the scope of the proposed image denoising model is further examined to obtain for improvement in retaining maximum latent image features. In a pilot work we studied “The Curious Case of the Finest Scale” to develop a Curvelet based deep learning model known as “DeepCurvelet-Net”: to progress beyond Curvelet thresholding.

## **Problem Formulation:** <br />
![L2Formulation](https://github.com/susant146/CTuNLM_Image-Denoising/assets/128124615/bdc5230d-de64-470e-8120-be427a6a1091) **Fig - 01**: The two denoised images have the same ‘ $l_2$ -distance to the clean image, but only the denoised image lying on the path between the noisy image and the clean image contains no new artifacts. <br />
<br />
![ProProbFormulation](https://github.com/susant146/CTuNLM_Image-Denoising/assets/128124615/6f3d8499-dcd9-4d5f-b3f1-bd18f25dc5bc) <br /> **Fig - 02**: Proposed Problem Formulation.
<br />
![Eq1](https://github.com/susant146/CTuNLM_Image-Denoising/assets/128124615/7811bd6d-8da3-450c-8e9d-9efddafa2db1)
<br />
![PropDenoisingFramework](https://github.com/susant146/CTuNLM_Image-Denoising/assets/128124615/a1d0795b-8242-42ac-a258-0a49e8e7dafa) <br /> **Fig - 03**:Block Diagram of the Proposed CTuNLM Framework. Here $S(\dot)$ and $S^{−1}(\cdot)$ are forward and inverse color transform matrix.

## **Results** <br />
![VisualComp1](https://github.com/susant146/CTuNLM_Image-Denoising/assets/128124615/7e7fb8cf-fce9-4bb3-a19d-2a54a6c18178) <br /> **Fig - 04**:Visual Comparision - 01
<br />
![QantComp1](https://github.com/susant146/CTuNLM_Image-Denoising/assets/128124615/4869e088-36f6-4f1c-bf31-63908cccfaa5)
<br /> **Fig - 05**: Visual and quantitative comparison 01. (b) PSNR = 37.9748, SSIM = 0.9458; (c) PSNR = 41.2228, SSIM = 0.9798; (d) PSNR = 42.8671, SSIM = 0.9847; (e) PSNR = 42.2852, SSIM = 0.9846; (f) PSNR = 42.4273, SSIM = 0.9837; (g) PSNR = 41.7750, SSIM = 0.9738; (h) PSNR = 41.7191, SSIM = 0.9775; (i) PSNR = 42.7998, SSIM = 0.9850; (j) PSNR = 42.9445, SSIM = 0.9894. **Image Ref:** {S. Nam, Y. Hwang, Y. Matsushita, and S. J. Kim, “A holistic approach to cross-channel image noise modeling and its application to image denoising,” in Proceedings of the IEEE conference on computer vision and pattern recognition, 2016, pp. 1683–1691} <br />
<br />

