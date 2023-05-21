FROM golang:1.19 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o server .

FROM scratch as prod
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT [ "./server" ]