# Файлы для итогового задания

В директории `tests` находятся тесты для проверки API, которое должно быть реализовано в веб-сервере.

Директория `web` содержит файлы фронтенда.


# Планировщик задач

Веб-сервер с REST API и интерфейсом для управления задачами. Поддерживает создание, редактирование, удаление задач с повторяющимися событиями и хранение данных в SQLite.

## ✅ Выполненные задания со звёздочкой
- [x] Реализация Docker-образа
- Задания повышенной сложности не выполнялись

## 🚀 Локальный запуск

### Требования:
- Go 1.21+
- SQLite3

1. Клонируйте репозиторий:
git clone https://github.com/yourusername/go_final_project.git
cd go_final_project
Создайте файл .env:
env
Copy
PORT=7540
DB_PATH=./scheduler.db
WEB_PATH=./web
Запустите сервер:
go run cmd/todo_app/main.go
Откройте в браузере: http://localhost:7540
🧪 Тестирование
Настройте tests/settings.go:
const (
    TestDB   = "file:test.db?cache=shared&mode=memory" // Тестовая БД в памяти
    BaseURL  = "http://localhost:7540"                 // Адрес сервера
)
Запустите тесты:
go test -v ./tests/...
🐳 Docker
Сборка образа:
docker build -t todo-scheduler .
Запуск контейнера:
docker run -d \
  -p 7540:7540 \
  -v /путь/к/данным:/app/data \
  -e TODO_DBFILE=/app/data/scheduler.db \
  --name scheduler \
  todo-scheduler
⚙️ Технологии
Go 1.21
SQLite
Docker
Gin (роутинг)
Sqlx (работа с БД)