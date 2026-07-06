FROM texlive/texlive:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
        make \
        python3 \
        pandoc \
        graphviz \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /thesis