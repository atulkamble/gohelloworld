## 📦 Go Hello World Docker Project

This guide will walk you through creating a simple **Go Hello World** app, containerizing it with Docker, and running it locally.

---

```bash
git clone https://github.com/atulkamble/gohelloworld.git
cd gohelloworld
```

---

## 📁 Project Structure

```
.
├── Dockerfile
└── helloworld.go
```

---

## 📜 Steps to Build and Run

### 1️⃣ Create Go Hello World Script

```bash
touch helloworld.go
```

Open and add the following code:

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World from Dockerized Go App!")
}
```

Check the file:

```bash
cat helloworld.go
```

Run it locally to test (if Go is installed):

```bash
go version
go run helloworld.go
```

---

### 2️⃣ Create Dockerfile

```bash
touch Dockerfile
```

Edit and add the following content:

```Dockerfile
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
```

Check files:

```bash
ls
```

---

### 3️⃣ Build Docker Image

```bash
docker build -t atuljkamble/gohelloworld .
```

Check Docker images:

```bash
docker images
```

---

### 4️⃣ Push Docker Image to Docker Hub

```bash
docker push atuljkamble/gohelloworld
```

---

### 5️⃣ Pull Image (if testing from another system)

```bash
docker pull atuljkamble/gohelloworld
```

---

### 6️⃣ Run Docker Container

```bash
docker run atuljkamble/gohelloworld
```

Check running containers:

```bash
docker container ls
docker ps -a
```

---

## ✅ Output Example

```
Hello, World from Dockerized Go App!
```

---

## 📌 Notes

* Make sure you’re logged in to Docker Hub before pushing:

  ```bash
  docker login
  ```
* Replace `atuljkamble` with your Docker Hub username if different.
---
## 👨‍💻 Author

**Atul Kamble**

- 💼 [LinkedIn](https://www.linkedin.com/in/atuljkamble)
- 🐙 [GitHub](https://github.com/atulkamble)
- 🐦 [X](https://x.com/Atul_Kamble)
- 📷 [Instagram](https://www.instagram.com/atuljkamble)
- 🌐 [Website](https://www.atulkamble.in)
