#!/bin/bash
today=$(date +%Y-%m-%d)
target="/home/pavel/tmp/$today"

# Создаем директорию с сегодняшней датой
mkdir -p "$target"

# Обновляем симлинк в /home/pavel (например, называем его "latest")
ln -sfn "$target" /home/pavel/latest
