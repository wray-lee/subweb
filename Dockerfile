FROM wray-lee/subconverter
LABEL maintainer="wray-lee <wray_lee@outlook.com>"

ENV VERSION 0.8.1

WORKDIR /base
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

COPY groups.txt rulesets.txt /base/snippets/
COPY pref.yml /base

EXPOSE 25500

WORKDIR /base

CMD subconverter
