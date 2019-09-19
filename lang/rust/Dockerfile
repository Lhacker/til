FROM rust:1.31.0

RUN mkdir -pv /usr/src/myapp
WORKDIR /usr/src/myapp
COPY . .

RUN cargo install --path .

CMD ["myapp"]
