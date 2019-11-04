# Build Phase
# Use node:alpine
FROM node:alpine AS builder
# Copy the package.json file 
WORKDIR '/app'
COPY package.json .
# Install dependencies
RUN npm install
COPY . .
# Run 'npm run build'
RUN npm run build

# Run Phase
# Use nginx
FROM nginx
EXPOSE 80
# Copy over the result of 'npm run build'
COPY --from=builder /app/build /usr/share/nginx/html
# Start nginx

