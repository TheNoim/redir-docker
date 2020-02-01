FROM alpine as build

WORKDIR /app

RUN apk add --update alpine-sdk git automake autoconf libtool pkgconfig tree

RUN git clone https://github.com/troglobit/redir.git

RUN	cd redir/ && \
    chmod +x ./autogen.sh && ./autogen.sh && \
    chmod +x ./configure && ./configure && \
    make && tree .

FROM alpine

COPY ./run.sh /run.sh

RUN chmod +x /run.sh

COPY --from=build /app/redir/redir /usr/bin/redir

CMD ["/bin/sh", "-c", "/run.sh"]