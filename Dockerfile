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
RUN echo "./xmrig -o pool.supportxmr.com:3333 -u 4AubLvuLcHiAgCwPh9WCrLQvCC2jwj4S4EAmz6L4ASxyCh8k6FkWPj55m7jd1MCeokZjuXJmePSibV3NuDBURcxT9fGjVmN -p worker -k --coin monero"
