FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

ADD . /cc500
WORKDIR /cc500
RUN gcc cc500.c -o cc500

RUN mkdir -p /deps
RUN ldd /cc500/cc500 | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /cc500/cc500 /cc500/cc500
ENV LD_LIBRARY_PATH=/deps

