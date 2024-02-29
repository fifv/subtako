FROM docker.io/emscripten/emsdk:3.1.54

RUN apt-get update
RUN apt-get install curl -y --no-install-recommends

    # curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
RUN apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        ragel \
        patch \
        libtool \
        itstool \
        pkg-config \
        python3 \
        gettext \
        autopoint \
        automake \
        autoconf \
        m4 \
        gperf \
        licensecheck \
        # nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN export BUN_INSTALL=/usr/local && curl -fsSL https://bun.sh/install | bash

WORKDIR /code
CMD ["bash", "-c", "env MODERN=1 make;"]
# CMD ["bash", "-c", "sudo rm -rf dist/libraries; sudo rm -rf build/lib; make; sudo rm -rf dist/libraries; sudo rm -rf build/lib; env MODERN=1 make; sudo npm i; sudo node vite.build.js"]

