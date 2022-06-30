FROM python:3.11.0b3-alpine3.15

RUN apk add --no-cache --virtual=.build-dependencies g++ gfortran file binutils musl-dev openblas-dev
RUN apk add libstdc++ openblas git
RUN ln -s locale.h /usr/include/xlocale.h

RUN pip3 install cython

RUN pip3 wheel nltk==3.4.5 --wheel-dir /output
RUN mkdir -p /data/nltk

CMD ["/bin/sh", "-c", "cp -r /output /data/nltk"]
