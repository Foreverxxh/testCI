FROM golang:1.19-alpine3.15 as builder
COPY . /src
WORKDIR /src
ENV GOPROXY "https://goproxy.cn"
RUN go build -o /build/yuni

FROM alpine:3.15
COPY --from=builder /build/yuni /usr/bin/yuni
WORKDIR /
ENTRYPOINT [ "yuni" ]