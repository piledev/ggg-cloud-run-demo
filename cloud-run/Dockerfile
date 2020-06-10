# Use the official Golang image to create a build artifact.
# This is based on Debian and sets the GOPATH to /go.
# https://hub.docker.com/_/golang
FROM golang:latest as builder

# Create and change to the app directory.
WORKDIR /app

# Copy local code to the container image.
COPY ./cloud-run ./

# Build the binary.
RUN go test

# Build the binary.
RUN CGO_ENABLED=0 GOOS=linux go build -v -o server

# Use the official Alpine image for a lean production container.
FROM alpine:latest
RUN apk add --no-cache ca-certificates

# Copy the binary to the production image from the builder stage.
COPY --from=builder /app/server /server

# Run the web service on container startup.
CMD ["/server"]
    