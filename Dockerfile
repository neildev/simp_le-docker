FROM alpine:latest
RUN apk add --update python ca-certificates git musl-dev python-dev gcc openssl-dev libffi-dev curl && rm -rf /var/cache/apk/*
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN mkdir /opt
RUN git clone https://github.com/kuba/simp_le /opt/simp_le
RUN chmod u+x /opt/simp_le/simp_le.py
RUN pip install acme==0.1.0 cryptography pyOpenSSL pytz requests
# Customization happens from here
ENV DOMAIN example.com
ENV EMAIL you@example.com
RUN mkdir -p /srv/www/$DOMAIN/html 
RUN mkdir -p /srv/cert/$DOMAIN
RUN cd /srv/cert/$DOMAIN
ADD . $SRC
EXPOSE 80/tcp
ENTRYPOINT ["/bin/sh", "run_both.sh"]
