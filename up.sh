#!/bin/bash
set -euo pipefail  # Строгая обработка ошибок: exit при ошибке, неопределенные переменные, ошибки в pipe

# Конфигурация: пути можно переопределить через переменные окружения
BASE_DIR="${BASE_DIR:-/home/pavel/tmp}"
LATEST_LINK="${LATEST_LINK:-/home/pavel/latest}"

# Получаем текущую дату в формате YYYY-MM-DD
today=$(date +%Y-%m-%d)
target="$BASE_DIR/$today"

# Функция для вывода сообщений об ошибках
error_exit() {
    echo "Ошибка: $1" >&2
    exit "${2:-1}"
}

# Создаем директорию с сегодняшней датой
echo "Создание директории: $target"
if ! mkdir -p "$target"; then
    error_exit "Не удалось создать директорию $target" 1
fi

# Обновляем симлинк
echo "Обновление симлинка $LATEST_LINK -> $target"
if ! ln -sfn "$target" "$LATEST_LINK"; then
    error_exit "Не удалось создать симлинк $LATEST_LINK" 2
fi

echo "Готово! Директория создана и симлинк обновлен."
