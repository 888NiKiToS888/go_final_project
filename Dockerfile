# Этап сборки
FROM golang:1.21-alpine AS builder
WORKDIR /app

# Копируем зависимости первыми для кэширования
COPY go.mod go.sum ./
RUN go mod download

# Копируем исходный код
COPY . .

# Компилируем для Linux
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o todo_app ./cmd/todo_app/main.go

# Финальный образ
FROM alpine:latest
WORKDIR /app

# Копируем бинарник и веб-ресурсы
COPY --from=builder /app/todo_app .
COPY --from=builder /app/web ./web

# Настройки
EXPOSE 7540
ENV TODO_PORT=7540 \
    TODO_DBFILE=/data/scheduler.db \
    TODO_WEB_PATH=./web

# Точка монтирования для БД
VOLUME /data

# Запуск
CMD ["./todo_app"]