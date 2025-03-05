package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	// Определяем порт сервера
	port := getPort()

	// Настройка обработчика для статических файлов
	http.Handle("/", http.FileServer(http.Dir("web")))

	// Запуск сервера
	log.Printf("Сервер запущен на http://localhost:%s\n", port)
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatalf("Ошибка при запуске сервера: %v", err)
	}
}

// getPort возвращает порт из переменной окружения или значение по умолчанию
func getPort() string {
	port := os.Getenv("TODO_PORT")
	if port == "" {
		port = "7540" // Порт по умолчанию
	}
	return port
}
