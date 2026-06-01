FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y git build-essential cmake automake libtool autoconf
RUN apt install -y libhwloc-dev libuv1-dev libssl-dev msr-tools


RUN git clone https://github.com/xmrig/xmrig.git

RUN cd xmrig
RUN mkdir build && cd build
RUN cmake ..
RUN make -j$(nproc)

RUN echo "XMRig installation complete!"
RUN echo "To start mining, run:"
RUN echo "./xmrig -o pool.supportxmr.com:3333 -u 8BzjxL221yThZbpUJnf2zjRH7HWpZPvtAjKaH2kZWKkLfB4Ec3E3L3u3BFsXSaBpv1Azse61sxaDg9TofforcXBz5t3BDtJ -p worker -k --coin monero"
