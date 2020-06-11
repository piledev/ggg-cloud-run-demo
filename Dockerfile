# FROM golang:1.14.4-alpine3.12 as builder
FROM golang:1.14.4-alpine3.12 as builder

# Create and change to the app directory.
WORKDIR /app

# Copy local code to the container image.
COPY . .

# Build the binary.
RUN CGO_ENABLED=0 go build -v 


# Use the official Alpine image for a lean production container.
FROM alpine:3.7
RUN apk add --no-cache ca-certificates

# Copy the binary to the production image from the builder stage.
COPY --from=builder /app/app /server

# Run the web service on container startup.
CMD ["/server"]
    