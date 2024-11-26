ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache python3 py3-pip gcc musl-dev python3-dev libffi-dev openssl-dev cargo
RUN apk add py3-pywinrm
RUN apk del gcc musl-dev python3-dev libffi-dev openssl-dev cargo

# Copy data
COPY data/run.sh /
COPY data/run.py /

RUN chmod a+x /run.sh
RUN chmod a+x /run.py

CMD [ "/run.sh" ]
