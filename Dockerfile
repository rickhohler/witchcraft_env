from ubuntu:14.04

RUN  apt-get update \
  && apt-get install -y wget git software-properties-common

RUN apt-get --fix-broken install -y python-pycurl python-apt

# Add repo for clang
# RUN add-apt-repository ppa:kxstudio-team/builds
# RUN apt-get update

# Install dependencies
RUN apt-get install -y binutils-dev clang-3.5 libelf-dev libgsl0-dev \
  libiberty-dev libreadline6 libreadline6-dev make uthash-dev

# Install latest capstone and capstone-dev
# from "Ubuntu 14.04 - DEB packages" http://www.capstone-engine.org/download.html
RUN wget http://www.capstone-engine.org/download/3.0.4/ubuntu-14.04/libcapstone3_3.0.4-0.1ubuntu1_amd64.deb
RUN dpkg -i libcapstone3_3.0.4-0.1ubuntu1_amd64.deb
RUN wget http://www.capstone-engine.org/download/3.0.4/ubuntu-14.04/libcapstone-dev_3.0.4-0.1ubuntu1_amd64.deb
RUN dpkg -i libcapstone-dev_3.0.4-0.1ubuntu1_amd64.deb

RUN ln -s /usr/bin/clang-3.5 /usr/bin/cc
RUN ln -s /usr/bin/clang-3.5 /usr/bin/gcc

WORKDIR "/src"
RUN git clone https://github.com/endrazine/wcc.git
WORKDIR "/src/wcc"

RUN git submodule init
RUN git submodule update

RUN make
RUN make install

