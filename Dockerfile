FROM golang:alpine3.18 AS build

WORKDIR /src

COPY . .

RUN go mod init hello

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o app

FROM scratch

COPY --from=build /src/app /app

CMD ["/app"]
