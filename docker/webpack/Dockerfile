FROM node:11.3.0

WORKDIR /app
#COPY ./webpack.config.js /app/webpack.config.js

RUN npm init -y
RUN npm install -g webpack --save-dev
RUN npm install -g webpack-cli --save-dev
RUN npm install -g webpack-dev-server --save-dev
RUN npm install --save react react-dom
RUN npm install --save-dev babel-loader babel-core babel-preset-env babel-preset-react
