FROM ubuntu:20.04

ENV USERNAME dockeruser


ARG DEBIAN_FRONTEND=noninteractive

# Install Python 2.7
RUN apt-get update && apt-get install -y curl build-essential python2 nano python3 python3-distutils chrpath cpio diffstat gawk texinfo wget locales libc6 libc6-dev zstd liblz4-tool
RUN apt install -y build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd xfonts-utils libxcb-render-util0-dev python3-json python3-pip jq
 
#lz4c pzstd unzstd zstd
 
# Set up Python 2 pip
#RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2

# Install any other dependencies for OpenEmbedded
#RUN apt-get install -y git

# Set Python 2 as default
#RUN ln -sf /usr/bin/python2 /usr/bin/python

RUN  useradd -m -s /bin/bash "${USERNAME}" && echo "${USERNAME}":"${USERNAME}" | chpasswd && adduser "${USERNAME}" sudo

# Set work directory
RUN mkdir yocto-ws

#COPY . yocto-ws/

USER root

RUN chown ${USERNAME}:${USERNAME} -R yocto-ws/

RUN locale-gen "en_US.UTF-8"

RUN git config --global user.name "Abel Tomn"
RUN git config --global user.email "aaff@eertom.com"

CMD ["/bin/bash"]
