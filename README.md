# Modular TLS Benchmarking

## Components

- [nghttp2](https://github.com/nghttp2/nghttp2) - HTTP/2 C library and tools
- [NGINX build](https://github.com/Post-Quantum-Mesh/nginx-oqs)
- [Envoy build](https://github.com/Post-Quantum-Mesh/envoy-oqs)

## Quick Start

Note: 
- Docker is required for building the images
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


### Benchmarking NGINX-OQS vs NGINX

The two folders inside the [nginx directory](https://github.com/Post-Quantum-Mesh/benchmarking/tree/main/nginx) contain an nginx-oqs fork and a vanilla implementation of an nginx reverse proxy.

Each of these can be initialized with the following

    ./init.sh
        
and then terminated using

    ./kill.sh


### Benchmarking Envoy

Note: This build currently is only functional with standard RSA encryption

The current envoy-oqs build is found inside the [envoy directory](https://github.com/Post-Quantum-Mesh/benchmarking/tree/main/envoy).

To start the build, run

    ./init.sh
    
To terminate, use

    ./kill.sh


### Test Script Instructions

A sample test script has been provided, and can be run by

    python test_script.py
    
The above script requires that nghttp2 has been built locally from source with the correct configurations. h2load can also be used from the command line, for example

    h2load -n100000 -t4 -c8 --ht https://localhost:4433

The script runs through a sample range of parameters that can be modified within the file itself.

    num_threads = h2load -t flag
    num_concurrent = h2load -c flag
    n_iter = number of iterations to average for each parameter combination

The full documentation can be found [here](https://nghttp2.org/documentation/h2load.1.html)
