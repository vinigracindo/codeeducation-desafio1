FROM golang:1.14 AS builder

WORKDIR /go/src/app

COPY . .

RUN go build -ldflags "-w" main.go

FROM hello-world:latest
COPY --from=builder /go/src/app .
CMD ["./main"]