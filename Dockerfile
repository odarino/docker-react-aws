FROM node:10.22.1-alpine3.10 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build build folder
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
