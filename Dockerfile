FROM golang:1.21.6
WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN go build -o /go-demo
EXPOSE 8080

CMD [ "/go-demo" ]