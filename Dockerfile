# use ubuntu jammy
FROM ubuntu:jammy

RUN apt update && apt install nala -y

RUN nala install -y \ 
 autoconf \
 wget \
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
 libboost-regex-dev \
 libexpected-dev \
 libgirepository1.0-dev \
 libglib2.0-dev \
 libglibmm-2.4-dev \
 libhunspell-dev \
 libjpeg-dev \
 libkf5coreaddons-dev \
 liblz4-dev \
 libminizip-dev \
 libmsgsl-dev \
 libopenal-dev \
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
 node-prismjs \
 node-types-lodash.isequal \
 nodejs \
 ninja-build \
 pkg-config \
 python3:any \
 qtbase5-dev \
 qtbase5-private-dev \
 protobuf-compiler \
 clang \
 qtdeclarative5-dev \
 zlib1g-dev \
 git vim neovim

RUN git clone https://github.com/xiph/rnnoise.git && cd rnnoise \
 && ./autogen.sh && ./configure && make install \
 && cd .. && rm -rf rnnoise

 RUN git clone https://git.launchpad.net/ubuntu/+source/cppgir && cd cppgir \
 && mkdir build \ 
 && cd build \
 && cmake .. \
 && cmake --build . \
 && cmake --install .\
 && cd .. && rm -rf cppgir
 
