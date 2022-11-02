FROM node:16.12.0-alpine

ENV PORT 3000

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Installing dependencies
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/

RUN yarn install

# Copying source files
COPY . /usr/src/app

RUN yarn run codegen

# Building app
RUN yarn build
EXPOSE 3000

# Running the app
CMD "npm" "run" "dev"