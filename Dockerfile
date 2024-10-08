# Stage 1: Build the mdBook
# Zie: https://hub.docker.com/_/nginx
FROM rust:1.81.0 AS builder

# Install mdbook
RUN cargo install mdbook --version 0.4.40

# Install necessary mdbook preprocessors
RUN cargo install mdbook-linkcheck --locked --version 0.7.7
RUN cargo install mdbook-kroki-preprocessor --locked --version 0.2.0

# Set the working directory
WORKDIR /book

# Copy the contents of your book into the build container
COPY . .

# Build the mdBook using the installed mdbook binary
RUN mdbook build

# Stage 2: NGINX container to serve the built book
FROM nginx:1.27.1-alpine

# Copy the built book from the build container to NGINX's web root
COPY --from=builder /book/book/html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
