FROM debian:unstable

RUN /usr/lib/*/libc.so.6 --version
RUN apt update && apt install -y \
 autoconf \
 libopengl-dev \
 libopengl0 \
 wget \
 sudo \
 ronn \
 libjemalloc-dev \
 libyuv-dev \
 libyuv-utils \
 libyuv0 \
 libvpx-dev \
 libtgowt-dev \
 build-essential \
 llvm-18 \
 lld-18 \
 cmake \
 gobject-introspection \
 libtool \
 libarchive-tools \
 libasound2-dev \
 libavcodec-dev \
 libavfilter-dev \
 libavformat-dev \
 libavutil-dev \
 libfmt-dev \
 libboost-dev \
 libboost-all-dev \
 meson \
 mm-common \
 extra-cmake-modules \
 wayland-protocols \
 plasma-wayland-protocols \
 gir1.2-gobject-2.0 \
 python3-packaging \
 libboost-regex-dev \
 libexpected-dev \
 libgirepository1.0-dev \
 libglib2.0-dev \
 libglibmm-2.68-dev \
 libhunspell-dev \
 libjpeg-dev \
 libkf5coreaddons-dev \
 liblz4-dev \
 libminizip-dev \
 libmsgsl-dev \
 libopenal-dev \
 qtwayland5 \
 libopus-dev \
 libpulse-dev \
 libqrcodegencpp-dev \
 libqt5svg5-dev \
 libqt5waylandcompositor5-dev \
 librange-v3-dev \
 librlottie-dev \
 libssl-dev \
 libswresample-dev \
 libswscale-dev \
 libtgowt-dev \
 libxcb-keysyms1-dev \
 libxcb-record0-dev \
 libxcb-screensaver0-dev \
 libxcb1-dev \
 libxxhash-dev \
 pipewire \
 libxtst-dev \
 node-prismjs \
 node-types-lodash.isequal \
 nodejs \
 ninja-build \
 pkg-config \
 chrpath \
 python3:any \
 qtbase5-dev \
 qtbase5-private-dev \
 protobuf-compiler \
 clang-18 \
 qtdeclarative5-dev \
 zlib1g-dev \
 bison \
 flex \ 
 qtcreator \
 qtbase5-dev \
 qt5-qmake \
 qttools5-dev-tools \
 libncurses-dev \
 libelf-dev \
 elfutils \
 zstd \
 debhelper \
 gir1.2-gstreamer-1.0 \
 libqt5gstreamer-1.0-0 \
 dh-virtualenv \
 git vim neovim


RUN rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/abseil/abseil-cpp
WORKDIR abseil-cpp
RUN mkdir build
WORKDIR build
RUN cmake ..
RUN make
RUN make install
WORKDIR /
RUN rm -rf abseil-cpp

RUN git clone https://gitlab.com/mnauw/cppgir
WORKDIR cppgir
RUN git submodule update --init
RUN mkdir build
WORKDIR build
RUN cmake -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ..
RUN cmake --build .
RUN cmake --install .
WORKDIR /
RUN rm -rf cppgir

RUN git clone https://github.com/xiph/rnnoise.git && cd rnnoise \
 && ./autogen.sh && ./configure && make install \
 && cd .. && rm -rf rnnoise
