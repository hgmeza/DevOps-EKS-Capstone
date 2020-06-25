# Needs to be divided into stages:
# stage 1: build the react code
FROM node:12-alpine as react-builder
WORKDIR /app
COPY ./client ./
RUN yarn install
RUN yarn build

# stage 2: use the built code to host it on a nginx
FROM nginx:alpine
COPY --from=react-builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]