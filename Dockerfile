# Build and run:
#   docker build -t clion/ubuntu/cpp-env:1.0 -f Dockerfile.cpp-env-ubuntu .

FROM debian:12-slim

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

RUN echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware' > /etc/apt/sources.list \
  && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware' >> /etc/apt/sources.list \
  && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware' >> /etc/apt/sources.list \
  && echo 'deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware' >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y build-essential \
      curl \
      zip \
      gcc \
      g++ \
      gdb \
      clang \
      make \
      cmake \
      ninja-build \
      autoconf \
      automake \
      libtool \
      valgrind \
      locales-all \
      dos2unix \
      rsync \
      tar \
      python-is-python3 \
      python3 \
      python3-dev \
      python3-numpy \
      #libopenblas-dev \
      intel-mkl \
      swig4.0 \
      snap  \
      libomp-dev \
  && apt-get clean \
#  && curl https://cmake.org/files/v3.23/cmake-3.23.1.tar.gz | tar -xz \
#  && cd cmake-3.23.1 && ./bootstrap && make -j`nproc` && make install
