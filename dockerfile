FROM node:14 as build-stage
WORKDIR /app
COPY . .

RUN yarn install && yarn build

FROM nginx:alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]