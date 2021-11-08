FROM node:17

WORKDIR /usr/src/app

COPY vcommerce/. .
RUN yarn
RUN chmod +x /usr/src/app/wait-for-it.sh
RUN yarn build
