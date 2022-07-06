# Modular TLS Benchmarking

## Components

- [nghttp2](https://github.com/nghttp2/nghttp2) - HTTP/2 C library and tools
- [NGINX build](https://github.com/Post-Quantum-Mesh/nginx-oqs)
- [Envoy build](https://github.com/Post-Quantum-Mesh/envoy-oqs)

## Quick Start

Note: 
- NGINX and Envoy build instructions can be found in the above linked repos
- The paths referenced in step 3 below assume the example paths in the above linked instructions were used

### NGHTTP2 Setup

1. Update package manager

        apt-get update

2. Install dependencies

        apt-get install g++ make binutils autoconf automake autotools-dev libtool pkg-config zlib1g-dev \
          libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev libc-ares-dev \
          libjemalloc-dev libsystemd-dev cython python3-dev python-setuptools

3. Build nghttp2 from git

        git clone https://github.com/nghttp2/nghttp2.git
        git submodule update --init
        autoreconf -i
        automake
        autoconf
        ./configure --enable-app --with-openssl=/usr/local/openssl/.openssl/bin/openssl \
          OPENSSL_LIBS="-L/usr/local/openssl/.openssl/lib -lssl -lcrypto -loqs" \
          OPENSSL_CFLAGS="-I/usr/local/openssl/.openssl/include"
        make


### Benchmark NGINX

1. Clone [nginx-oqs repo](https://github.com/Post-Quantum-Mesh/nginx-oqs), start server

        ./init.sh



