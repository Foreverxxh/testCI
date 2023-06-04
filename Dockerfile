FROM golang:1.16-alpine3.15 as builder
COPY . /src
WORKDIR /src
ENV GOPROXY "https://goproxy.cn"
RUN go build -o /build/yuni ./cmd/yuni

FROM alpine:3.15
COPY --from=builder /build/yuni /usr/bin/yuni
WORKDIR /
ENTRYPOINT [ "yuni" ]