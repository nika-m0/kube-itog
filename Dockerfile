FROM golang:1.25.4-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o /root-app ./cmd/root-service
RUN go build -o /api-app ./cmd/api-service
RUN go build -o /info-app ./cmd/info-service
RUN go build -o /login-app ./cmd/login-service

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /app

COPY --from=builder /root-app .
COPY --from=builder /api-app .
COPY --from=builder /info-app .
COPY --from=builder /login-app .

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 8080 8081 8082 8083

ENTRYPOINT ["./entrypoint.sh"]