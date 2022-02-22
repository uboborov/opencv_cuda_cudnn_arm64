# opencv_cuda_cudnn_arm64

## Installation guide (nvidia jetson nano)

1. Download CUDA libraries (cuda-repo-l4t-10-2-local-10.2.89_1.0-1_arm64.deb) via SDK manager
2. Unpack cuda-repo-l4t-10-2-local-10.2.89_1.0-1_arm64.deb to some folder (~/cuda/sdk)
3. Upack needed debs from folder ~/cuda/sdk
```
├── cuda-core-10-2_10.2.89-1_arm64.deb
├── cuda-cudart-10-2_10.2.89-1_arm64.deb
├── cuda-cufft-10-2_10.2.89-1_arm64.deb
├── cuda-cupti-10-2_10.2.89-1_arm64.deb
├── cuda-curand-10-2_10.2.89-1_arm64.deb
├── cuda-cusolver-10-2_10.2.89-1_arm64.deb
├── cuda-cusparse-10-2_10.2.89-1_arm64.deb
├── cuda-driver-dev-10-2_10.2.89-1_arm64.deb
├── cuda-libraries-10-2_10.2.89-1_arm64.deb
├── cuda-npp-10-2_10.2.89-1_arm64.deb
├── cuda-nvgraph-10-2_10.2.89-1_arm64.deb
├── cuda-nvml-dev-10-2_10.2.89-1_arm64.deb
├── cuda-nvprof-10-2_10.2.89-1_arm64.deb
├── cuda-nvprune-10-2_10.2.89-1_arm64.deb
├── cuda-nvrtc-10-2_10.2.89-1_arm64.deb
├── cuda-nvtx-10-2_10.2.89-1_arm64.deb
└── libcublas10_10.2.2.89-1_arm64.deb
```
after unpacking needed debs the directory tree ./usr/local/cuda-10.2/targets/aarch64-linux/lib looks like this:
```
.
├── libcudart.so.10.2 -> libcudart.so.10.2.89
├── libcudart.so.10.2.89
├── libcufft.so.10 -> libcufft.so.10.1.2.89
├── libcufft.so.10.1.2.89
├── libcufftw.so.10 -> libcufftw.so.10.1.2.89
├── libcufftw.so.10.1.2.89
├── libcuinj64.so -> libcuinj64.so.10.2
├── libcuinj64.so.10.2 -> libcuinj64.so.10.2.89
├── libcuinj64.so.10.2.89
├── libcupti.so -> libcupti.so.10.2
├── libcupti.so.10.2 -> libcupti.so.10.2.75
├── libcupti.so.10.2.75
├── libcurand.so.10 -> libcurand.so.10.1.2.89
├── libcurand.so.10.1.2.89
├── libcusolver.so.10 -> libcusolver.so.10.3.0.89
├── libcusolver.so.10.3.0.89
├── libcusparse.so.10 -> libcusparse.so.10.3.1.89
├── libcusparse.so.10.3.1.89
├── libnppc.so.10 -> libnppc.so.10.2.1.89
├── libnppc.so.10.2.1.89
├── libnppial.so.10 -> libnppial.so.10.2.1.89
├── libnppial.so.10.2.1.89
├── libnppicc.so.10 -> libnppicc.so.10.2.1.89
├── libnppicc.so.10.2.1.89
├── libnppicom.so.10 -> libnppicom.so.10.2.1.89
├── libnppicom.so.10.2.1.89
├── libnppidei.so.10 -> libnppidei.so.10.2.1.89
├── libnppidei.so.10.2.1.89
├── libnppif.so.10 -> libnppif.so.10.2.1.89
├── libnppif.so.10.2.1.89
├── libnppig.so.10 -> libnppig.so.10.2.1.89
├── libnppig.so.10.2.1.89
├── libnppim.so.10 -> libnppim.so.10.2.1.89
├── libnppim.so.10.2.1.89
├── libnppist.so.10 -> libnppist.so.10.2.1.89
├── libnppist.so.10.2.1.89
├── libnppisu.so.10 -> libnppisu.so.10.2.1.89
├── libnppisu.so.10.2.1.89
├── libnppitc.so.10 -> libnppitc.so.10.2.1.89
├── libnppitc.so.10.2.1.89
├── libnpps.so.10 -> libnpps.so.10.2.1.89
├── libnpps.so.10.2.1.89
├── libnvgraph.so.10 -> libnvgraph.so.10.2.89
├── libnvgraph.so.10.2.89
├── libnvperf_host.so
├── libnvperf_target.so
├── libnvrtc-builtins.so -> libnvrtc-builtins.so.10.2
├── libnvrtc-builtins.so.10.2 -> libnvrtc-builtins.so.10.2.89
├── libnvrtc-builtins.so.10.2.89
├── libnvrtc.so.10.2 -> libnvrtc.so.10.2.89
├── libnvrtc.so.10.2.89
├── libnvToolsExt.so -> libnvToolsExt.so.1
├── libnvToolsExt.so.1 -> libnvToolsExt.so.1.0.0
├── libnvToolsExt.so.1.0.0
└── stubs
    ├── libcuda.so
    └── libnvidia-ml.so
```
and the directory tree ./usr/lib/aarch64-linux-gnu looks like this:
```
├── libcublasLt.so.10 -> libcublasLt.so.10.2.2.89
├── libcublasLt.so.10.2.2.89
├── libcublas.so.10 -> libcublas.so.10.2.2.89
├── libcublas.so.10.2.2.89
├── libnvblas.so.10 -> libnvblas.so.10.2.2.89
└── libnvblas.so.10.2.2.89
```
4. Download cuDNN libraries from nvidia:
```
https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.6/JETPACK_46_b194/libcudnn8_8.2.1.32-1+cuda10.2_arm64.deb
https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.6/JETPACK_46_b194/libcudnn8-dev_8.2.1.32-1+cuda10.2_arm64.deb
```
5. Put libcudnn8_8.2.1.32-1+cuda10.2_arm64.deb and libcudnn8-dev_8.2.1.32-1+cuda10.2_arm64.deb to this repo location/cudnn folder
6. Upack libraries libcudnn8_8.2.1.32-1+cuda10.2_arm64.deb and libcudnn8-dev_8.2.1.32-1+cuda10.2_arm64.deb to the ./usr/lib/aarch64-linux-gnu
after upacking the directory tree ./usr/lib/aarch64-linux-gnu lookslike this:
```
.
├── libcublasLt.so.10 -> libcublasLt.so.10.2.2.89
├── libcublasLt.so.10.2.2.89
├── libcublas.so.10 -> libcublas.so.10.2.2.89
├── libcublas.so.10.2.2.89
├── libcudnn_adv_infer.so.8 -> libcudnn_adv_infer.so.8.2.1
├── libcudnn_adv_infer.so.8.2.1
├── libcudnn_adv_train.so.8 -> libcudnn_adv_train.so.8.2.1
├── libcudnn_adv_train.so.8.2.1
├── libcudnn_cnn_infer.so.8 -> libcudnn_cnn_infer.so.8.2.1
├── libcudnn_cnn_infer.so.8.2.1
├── libcudnn_cnn_train.so.8 -> libcudnn_cnn_train.so.8.2.1
├── libcudnn_cnn_train.so.8.2.1
├── libcudnn_ops_infer.so.8 -> libcudnn_ops_infer.so.8.2.1
├── libcudnn_ops_infer.so.8.2.1
├── libcudnn_ops_train.so.8 -> libcudnn_ops_train.so.8.2.1
├── libcudnn_ops_train.so.8.2.1
├── libcudnn.so.8 -> libcudnn.so.8.2.1
├── libcudnn.so.8.2.1
├── libnvblas.so.10 -> libnvblas.so.10.2.2.89
└── libnvblas.so.10.2.2.89
```
7. Afrer all unpacking done run docker build for cuda and cudnn from this repo folder:
```
sudo docker build -t "aarch64-cuda10-2" -f aarch64-cuda-10-2-ubuntu18.dockerfile .
```
8. After build done run docker build for opencv-4.5.3 from this repo folder:
```
sudo docker build -t "opencv-cuda" -f build-opencv-cuda.dockerfile .
```
9. After build done run the container and copy build opencv libraries to some location:
```
docker cp $container_id:/opencv-4.5.3/build_aarch64_cuda/ ./opencv-4.5.3
```
10. copy opencv libraries from ./opencv-4.5.3 to ./usr/local/lib
and the directory tree ./usr/local/lib looks like this:
```
├── libopencv_aruco.so -> libopencv_aruco.so.4.5
├── libopencv_aruco.so.4.5 -> libopencv_aruco.so.4.5.3
├── libopencv_aruco.so.4.5.3
├── libopencv_barcode.so -> libopencv_barcode.so.4.5
├── libopencv_barcode.so.4.5 -> libopencv_barcode.so.4.5.3
├── libopencv_barcode.so.4.5.3
├── libopencv_bgsegm.so -> libopencv_bgsegm.so.4.5
├── libopencv_bgsegm.so.4.5 -> libopencv_bgsegm.so.4.5.3
├── libopencv_bgsegm.so.4.5.3
├── libopencv_bioinspired.so -> libopencv_bioinspired.so.4.5
├── libopencv_bioinspired.so.4.5 -> libopencv_bioinspired.so.4.5.3
├── libopencv_bioinspired.so.4.5.3
├── libopencv_calib3d.so -> libopencv_calib3d.so.4.5
├── libopencv_calib3d.so.4.5 -> libopencv_calib3d.so.4.5.3
├── libopencv_calib3d.so.4.5.3
├── libopencv_ccalib.so -> libopencv_ccalib.so.4.5
├── libopencv_ccalib.so.4.5 -> libopencv_ccalib.so.4.5.3
├── libopencv_ccalib.so.4.5.3
├── libopencv_core.so -> libopencv_core.so.4.5
├── libopencv_core.so.4.5 -> libopencv_core.so.4.5.3
├── libopencv_core.so.4.5.3
├── libopencv_cudaarithm.so -> libopencv_cudaarithm.so.4.5
├── libopencv_cudaarithm.so.4.5 -> libopencv_cudaarithm.so.4.5.3
├── libopencv_cudaarithm.so.4.5.3
├── libopencv_cudabgsegm.so -> libopencv_cudabgsegm.so.4.5
├── libopencv_cudabgsegm.so.4.5 -> libopencv_cudabgsegm.so.4.5.3
├── libopencv_cudabgsegm.so.4.5.3
├── libopencv_cudacodec.so -> libopencv_cudacodec.so.4.5
├── libopencv_cudacodec.so.4.5 -> libopencv_cudacodec.so.4.5.3
├── libopencv_cudacodec.so.4.5.3
├── libopencv_cudafeatures2d.so -> libopencv_cudafeatures2d.so.4.5
├── libopencv_cudafeatures2d.so.4.5 -> libopencv_cudafeatures2d.so.4.5.3
├── libopencv_cudafeatures2d.so.4.5.3
├── libopencv_cudafilters.so -> libopencv_cudafilters.so.4.5
├── libopencv_cudafilters.so.4.5 -> libopencv_cudafilters.so.4.5.3
├── libopencv_cudafilters.so.4.5.3
├── libopencv_cudaimgproc.so -> libopencv_cudaimgproc.so.4.5
├── libopencv_cudaimgproc.so.4.5 -> libopencv_cudaimgproc.so.4.5.3
├── libopencv_cudaimgproc.so.4.5.3
├── libopencv_cudalegacy.so -> libopencv_cudalegacy.so.4.5
├── libopencv_cudalegacy.so.4.5 -> libopencv_cudalegacy.so.4.5.3
├── libopencv_cudalegacy.so.4.5.3
├── libopencv_cudaobjdetect.so -> libopencv_cudaobjdetect.so.4.5
├── libopencv_cudaobjdetect.so.4.5 -> libopencv_cudaobjdetect.so.4.5.3
├── libopencv_cudaobjdetect.so.4.5.3
├── libopencv_cudaoptflow.so -> libopencv_cudaoptflow.so.4.5
├── libopencv_cudaoptflow.so.4.5 -> libopencv_cudaoptflow.so.4.5.3
├── libopencv_cudaoptflow.so.4.5.3
├── libopencv_cudastereo.so -> libopencv_cudastereo.so.4.5
├── libopencv_cudastereo.so.4.5 -> libopencv_cudastereo.so.4.5.3
├── libopencv_cudastereo.so.4.5.3
├── libopencv_cudawarping.so -> libopencv_cudawarping.so.4.5
├── libopencv_cudawarping.so.4.5 -> libopencv_cudawarping.so.4.5.3
├── libopencv_cudawarping.so.4.5.3
├── libopencv_cudev.so -> libopencv_cudev.so.4.5
├── libopencv_cudev.so.4.5 -> libopencv_cudev.so.4.5.3
├── libopencv_cudev.so.4.5.3
├── libopencv_datasets.so -> libopencv_datasets.so.4.5
├── libopencv_datasets.so.4.5 -> libopencv_datasets.so.4.5.3
├── libopencv_datasets.so.4.5.3
├── libopencv_dnn_objdetect.so -> libopencv_dnn_objdetect.so.4.5
├── libopencv_dnn_objdetect.so.4.5 -> libopencv_dnn_objdetect.so.4.5.3
├── libopencv_dnn_objdetect.so.4.5.3
├── libopencv_dnn.so -> libopencv_dnn.so.4.5
├── libopencv_dnn.so.4.5 -> libopencv_dnn.so.4.5.3
├── libopencv_dnn.so.4.5.3
├── libopencv_dnn_superres.so -> libopencv_dnn_superres.so.4.5
├── libopencv_dnn_superres.so.4.5 -> libopencv_dnn_superres.so.4.5.3
├── libopencv_dnn_superres.so.4.5.3
├── libopencv_dpm.so -> libopencv_dpm.so.4.5
├── libopencv_dpm.so.4.5 -> libopencv_dpm.so.4.5.3
├── libopencv_dpm.so.4.5.3
├── libopencv_face.so -> libopencv_face.so.4.5
├── libopencv_face.so.4.5 -> libopencv_face.so.4.5.3
├── libopencv_face.so.4.5.3
├── libopencv_features2d.so -> libopencv_features2d.so.4.5
├── libopencv_features2d.so.4.5 -> libopencv_features2d.so.4.5.3
├── libopencv_features2d.so.4.5.3
├── libopencv_flann.so -> libopencv_flann.so.4.5
├── libopencv_flann.so.4.5 -> libopencv_flann.so.4.5.3
├── libopencv_flann.so.4.5.3
├── libopencv_fuzzy.so -> libopencv_fuzzy.so.4.5
├── libopencv_fuzzy.so.4.5 -> libopencv_fuzzy.so.4.5.3
├── libopencv_fuzzy.so.4.5.3
├── libopencv_gapi.so -> libopencv_gapi.so.4.5
├── libopencv_gapi.so.4.5 -> libopencv_gapi.so.4.5.3
├── libopencv_gapi.so.4.5.3
├── libopencv_hfs.so -> libopencv_hfs.so.4.5
├── libopencv_hfs.so.4.5 -> libopencv_hfs.so.4.5.3
├── libopencv_hfs.so.4.5.3
├── libopencv_highgui.so -> libopencv_highgui.so.4.5
├── libopencv_highgui.so.4.5 -> libopencv_highgui.so.4.5.3
├── libopencv_highgui.so.4.5.3
├── libopencv_imgcodecs.so -> libopencv_imgcodecs.so.4.5
├── libopencv_imgcodecs.so.4.5 -> libopencv_imgcodecs.so.4.5.3
├── libopencv_imgcodecs.so.4.5.3
├── libopencv_img_hash.so -> libopencv_img_hash.so.4.5
├── libopencv_img_hash.so.4.5 -> libopencv_img_hash.so.4.5.3
├── libopencv_img_hash.so.4.5.3
├── libopencv_imgproc.so -> libopencv_imgproc.so.4.5
├── libopencv_imgproc.so.4.5 -> libopencv_imgproc.so.4.5.3
├── libopencv_imgproc.so.4.5.3
├── libopencv_intensity_transform.so -> libopencv_intensity_transform.so.4.5
├── libopencv_intensity_transform.so.4.5 -> libopencv_intensity_transform.so.4.5.3
├── libopencv_intensity_transform.so.4.5.3
├── libopencv_line_descriptor.so -> libopencv_line_descriptor.so.4.5
├── libopencv_line_descriptor.so.4.5 -> libopencv_line_descriptor.so.4.5.3
├── libopencv_line_descriptor.so.4.5.3
├── libopencv_mcc.so -> libopencv_mcc.so.4.5
├── libopencv_mcc.so.4.5 -> libopencv_mcc.so.4.5.3
├── libopencv_mcc.so.4.5.3
├── libopencv_ml.so -> libopencv_ml.so.4.5
├── libopencv_ml.so.4.5 -> libopencv_ml.so.4.5.3
├── libopencv_ml.so.4.5.3
├── libopencv_objdetect.so -> libopencv_objdetect.so.4.5
├── libopencv_objdetect.so.4.5 -> libopencv_objdetect.so.4.5.3
├── libopencv_objdetect.so.4.5.3
├── libopencv_optflow.so -> libopencv_optflow.so.4.5
├── libopencv_optflow.so.4.5 -> libopencv_optflow.so.4.5.3
├── libopencv_optflow.so.4.5.3
├── libopencv_phase_unwrapping.so -> libopencv_phase_unwrapping.so.4.5
├── libopencv_phase_unwrapping.so.4.5 -> libopencv_phase_unwrapping.so.4.5.3
├── libopencv_phase_unwrapping.so.4.5.3
├── libopencv_photo.so -> libopencv_photo.so.4.5
├── libopencv_photo.so.4.5 -> libopencv_photo.so.4.5.3
├── libopencv_photo.so.4.5.3
├── libopencv_plot.so -> libopencv_plot.so.4.5
├── libopencv_plot.so.4.5 -> libopencv_plot.so.4.5.3
├── libopencv_plot.so.4.5.3
├── libopencv_quality.so -> libopencv_quality.so.4.5
├── libopencv_quality.so.4.5 -> libopencv_quality.so.4.5.3
├── libopencv_quality.so.4.5.3
├── libopencv_rapid.so -> libopencv_rapid.so.4.5
├── libopencv_rapid.so.4.5 -> libopencv_rapid.so.4.5.3
├── libopencv_rapid.so.4.5.3
├── libopencv_reg.so -> libopencv_reg.so.4.5
├── libopencv_reg.so.4.5 -> libopencv_reg.so.4.5.3
├── libopencv_reg.so.4.5.3
├── libopencv_rgbd.so -> libopencv_rgbd.so.4.5
├── libopencv_rgbd.so.4.5 -> libopencv_rgbd.so.4.5.3
├── libopencv_rgbd.so.4.5.3
├── libopencv_saliency.so -> libopencv_saliency.so.4.5
├── libopencv_saliency.so.4.5 -> libopencv_saliency.so.4.5.3
├── libopencv_saliency.so.4.5.3
├── libopencv_shape.so -> libopencv_shape.so.4.5
├── libopencv_shape.so.4.5 -> libopencv_shape.so.4.5.3
├── libopencv_shape.so.4.5.3
├── libopencv_stereo.so -> libopencv_stereo.so.4.5
├── libopencv_stereo.so.4.5 -> libopencv_stereo.so.4.5.3
├── libopencv_stereo.so.4.5.3
├── libopencv_stitching.so -> libopencv_stitching.so.4.5
├── libopencv_stitching.so.4.5 -> libopencv_stitching.so.4.5.3
├── libopencv_stitching.so.4.5.3
├── libopencv_structured_light.so -> libopencv_structured_light.so.4.5
├── libopencv_structured_light.so.4.5 -> libopencv_structured_light.so.4.5.3
├── libopencv_structured_light.so.4.5.3
├── libopencv_superres.so -> libopencv_superres.so.4.5
├── libopencv_superres.so.4.5 -> libopencv_superres.so.4.5.3
├── libopencv_superres.so.4.5.3
├── libopencv_surface_matching.so -> libopencv_surface_matching.so.4.5
├── libopencv_surface_matching.so.4.5 -> libopencv_surface_matching.so.4.5.3
├── libopencv_surface_matching.so.4.5.3
├── libopencv_text.so -> libopencv_text.so.4.5
├── libopencv_text.so.4.5 -> libopencv_text.so.4.5.3
├── libopencv_text.so.4.5.3
├── libopencv_tracking.so -> libopencv_tracking.so.4.5
├── libopencv_tracking.so.4.5 -> libopencv_tracking.so.4.5.3
├── libopencv_tracking.so.4.5.3
├── libopencv_videoio.so -> libopencv_videoio.so.4.5
├── libopencv_videoio.so.4.5 -> libopencv_videoio.so.4.5.3
├── libopencv_videoio.so.4.5.3
├── libopencv_video.so -> libopencv_video.so.4.5
├── libopencv_video.so.4.5 -> libopencv_video.so.4.5.3
├── libopencv_video.so.4.5.3
├── libopencv_videostab.so -> libopencv_videostab.so.4.5
├── libopencv_videostab.so.4.5 -> libopencv_videostab.so.4.5.3
├── libopencv_videostab.so.4.5.3
├── libopencv_wechat_qrcode.so -> libopencv_wechat_qrcode.so.4.5
├── libopencv_wechat_qrcode.so.4.5 -> libopencv_wechat_qrcode.so.4.5.3
├── libopencv_wechat_qrcode.so.4.5.3
├── libopencv_xfeatures2d.so -> libopencv_xfeatures2d.so.4.5
├── libopencv_xfeatures2d.so.4.5 -> libopencv_xfeatures2d.so.4.5.3
├── libopencv_xfeatures2d.so.4.5.3
├── libopencv_ximgproc.so -> libopencv_ximgproc.so.4.5
├── libopencv_ximgproc.so.4.5 -> libopencv_ximgproc.so.4.5.3
├── libopencv_ximgproc.so.4.5.3
├── libopencv_xobjdetect.so -> libopencv_xobjdetect.so.4.5
├── libopencv_xobjdetect.so.4.5 -> libopencv_xobjdetect.so.4.5.3
├── libopencv_xobjdetect.so.4.5.3
├── libopencv_xphoto.so -> libopencv_xphoto.so.4.5
├── libopencv_xphoto.so.4.5 -> libopencv_xphoto.so.4.5.3
└── libopencv_xphoto.so.4.5.3
```
11. Copy folder ./usr to the jetson nano root over NFS or SD card reader:
```
sudo cp -aR directory_nfs_path/usr/* /usr
```
or
```
sudo cp -aR ./usr/* mounted_sd_path/usr
```
12. Update ld.so.conf.d on your jetson nano board:
create file /etc/ld.so.conf.d/cuda-10-2.conf and add paths:
```
/usr/local/lib
/usr/local/cuda-10.2/lib
/usr/local/lib/aarch64-linux-gnu
/lib/aarch64-linux-gnu
/usr/lib/aarch64-linux-gnu
```
12. To build a project using opencv, cuda and cudnn use paths relative this repo directory in Makefile:
```
-I/path_to_opencv_copied_from_docker_container/usr/local/include/opencv4
-L/path_to_opencv_copied_from_docker_container/usr/local/lib
-L/path_to_cuda_upacked_libs/usr/local/cuda-10.2/targets/aarch64-linux/lib
-L/path_to_cudnn_unpacked_libs/usr/lib/aarch64-linux-gnu
```
13. That's it

P.S.
script *find_libs.sh* in this repo directory displays only libraries from cuda and cudnn needed for this opencv build and libraries in cuda needed for cuda (linked shared objects).
change paths to *CV_DIR*, *CU_DIR* and *L_DIR* accordingly to opencv, cuda and cudnn libraries paths.
run it and copy displayed libraries to the jetson nano board
