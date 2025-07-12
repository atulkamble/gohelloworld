# Use official Golang image as build stage
FROM golang:1.22-alpine AS builder

# Set working directory inside container
WORKDIR /app

# Copy Go source file
COPY helloworld.go .

# Build the Go binary
RUN go build -o helloworld helloworld.go

# Use minimal base image for final container
FROM alpine:latest

# Set working directory
WORKDIR /root/

# Copy the binary from builder stage
COPY --from=builder /app/helloworld .

# Command to run the binary
CMD ["./helloworld"]
