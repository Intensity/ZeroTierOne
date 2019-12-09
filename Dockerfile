FROM alpine:3.10

RUN apk add clang clang-dev clang-static g++ linux-headers make musl-dev
COPY . /usr/local/src/ZeroTierOne
RUN cd /usr/local/src/ZeroTierOne && umask 022 && export ZT_DEBUG=1 && export ZT_DEBUG_TRACE=1 && export ZT_TRACE=1 && export ZT_RULES_ENGINE_DEBUGGING=1 && $(make zerotier-one |grep one.o |tail -n 1) -static
