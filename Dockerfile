FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install 
COPY . . 
RUN npm run build

FROM nginx 
EXPOSE 3000
COPY --from=builder /app/build /usr/share/nginx/html

# # Use the docker image node:9.4
# FROM node:12.14.1
# # Into which the source will be copied inside the destination container.
# WORKDIR /app
# # It will copy the existing files to the `/app` directory.
# COPY . /app
# # Run npm install
# RUN npm install
# # Start the app.
# CMD npm start 
# # --production
# # Expose the port of the app thats running in the container.
# EXPOSE 3000