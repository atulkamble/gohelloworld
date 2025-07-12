FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY helloworld.go .
RUN go build -o helloworld helloworld.go
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/helloworld .
CMD ["./helloworld"]
