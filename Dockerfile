FROM amazonlinux:2

ENV VERSION_HUGO=0.67.0

RUN yum -y update       && \
    yum -y install         \
        git                \
        openssl            \
        openssh-clients    \
        py-pygments        \
        libc6-compat       \
        g++                \
        curl               \
        wget               \
        tar                \
    yum clean all       && \
    rm -rf /var/cache/yum

## Install Hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v${VERSION_HUGO}/hugo_extended_${VERSION_HUGO}_Linux-64bit.tar.gz && \
    tar -xf hugo_extended_${VERSION_HUGO}_Linux-64bit.tar.gz hugo -C / && \
    mv /hugo /usr/bin/hugo && \
    rm -rf hugo_extended_${VERSION_HUGO}_Linux-64bit.tar.gz

EXPOSE 1313
ENTRYPOINT [ "bash", "-c" ]
