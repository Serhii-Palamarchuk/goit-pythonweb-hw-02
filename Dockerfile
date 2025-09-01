# Використовуємо Python 3.10 як базовий образ
FROM python:3.10-slim

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Встановлюємо системні залежності
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Копіюємо файл requirements.txt
COPY requirements.txt .

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь код застосунку
COPY . .

# Відкриваємо порт 8000
EXPOSE 8000

# Команда для запуску застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
