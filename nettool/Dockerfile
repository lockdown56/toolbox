FROM alpine:3.12.0

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
      && apk --update add curl httpie apache2-utils vim bash python3 py-pip bind-tools \
      && pip install dnspython \
      && rm -rf /var/lib/apt/lists/* \
      && rm -rf /var/cache/apk/*

