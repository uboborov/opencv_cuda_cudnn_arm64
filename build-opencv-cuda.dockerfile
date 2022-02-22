FROM aarch64-cuda10-2

COPY scripts/build_opencv_my.sh / 

# RUN ./build_opencv_my.sh

# download opencv 4.5.3
RUN curl -o opencv.zip -L https://github.com/opencv/opencv/archive/4.5.3.zip
RUN unzip opencv

# download contrib package
RUN curl -o ./opencv_extra_4.5.3.zip https://codeload.github.com/opencv/opencv_contrib/zip/4.5.3
RUN unzip opencv_extra_4.5.3.zip

RUN cd opencv-4.5.3 && mkdir build_aarch64_cuda

WORKDIR opencv-4.5.3/build_aarch64_cuda

RUN echo 'set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")' | cat - ../cmake/OpenCVDetectCUDA.cmake > temp && mv temp ../cmake/OpenCVDetectCUDA.cmake

RUN cmake   -D CMAKE_INSTALL_PREFIX=/usr/local \
	-D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda/targets/aarch64-linux  \
	-DCMAKE_TOOLCHAIN_FILE=../platforms/linux/aarch64-gnu.toolchain.cmake \
	-DCMAKE_LIBRARY_PATH=/usr/local/cuda/targets/aarch64-linux/lib/stubs \
	-DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.5.3/modules \
	-D WITH_CUDA=ON \
	-D opencv_cudev=ON \
	-DCUDA_ARCH_BIN='5.3 6.2 7.2' \
	-DBUILD_opencv_cudev=ON \
	-D WITH_CAROTENE=OFF \
	-D CMAKE_BUILD_TYPE=RELEASE \
	-D BUILD_DOCS=OFF \
	-D BUILD_EXAMPLES=OFF \
	-D BUILD_opencv_apps=OFF \
	-D BUILD_opencv_python2=OFF \
	-D BUILD_opencv_python3=OFF \
	-D BUILD_PERF_TESTS=OFF \
	-D BUILD_TESTS=OFF \
	-D FORCE_VTK=OFF \
	-D WITH_FFMPEG=OFF \
	-D WITH_GDAL=OFF \
	-D WITH_IPP=OFF \
	-D WITH_OPENEXR=OFF \
	-D WITH_OPENGL=OFF \
	-D WITH_QT=OFF \
	-D WITH_TBB=OFF \
	-D WITH_XINE=OFF \
	-D BUILD_JPEG=ON \
	-D BUILD_ZLIB=ON \
	-D BUILD_PNG=ON \
	-D BUILD_TIFF=ON \
	-D BUILD_BUILD_JASPER=OFF \
	-D WITH_ITT=OFF \
	-D WITH_LAPACK=OFF \
	-D WITH_OPENCL=OFF \
	-D WITH_TIFF=ON \
	-D WITH_PNG=ON \
	-D WITH_OPENCLAMDFFT=OFF \
	-D WITH_OPENCLAMDBLAS=OFF \
	-D WITH_VA_INTEL=OFF \
	-D WITH_WEBP=OFF \
	-DENABLE_NEON=ON \
	-D ENABLE_FAST_MATH=ON \
	-D CUDA_FAST_MATH=ON \
	-D CUDNN_VERSION='8.2' \
	-DCUDNN_LIBRARY=/usr/lib/aarch64-linux-gnu/libcudnn.so \
	-DCUDNN_INCLUDE_DIR=/usr/include/aarch64-linux-gnu \
	-D WITH_CUDNN=ON \
	-D OPENCV_DNN_CUDA=ON \
	-D WITH_JASPER=OFF ..

RUN nproc | xargs -I % make -j%
RUN mkdir packaged
RUN make -j $(nproc) DESTDIR=./packaged install

WORKDIR /

