# Step 1: Build  App
FROM node:20-bullseye AS builder
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm run build

# Step 2: Serve with NGINX
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/packages/server/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
