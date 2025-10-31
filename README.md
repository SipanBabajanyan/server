# Neetrino Test Server

Простой тестовый Node.js сервер на Express для проверки работы на продакшене.

## 🚀 Быстрый старт

### Локальная разработка

```bash
# Установить зависимости
npm install

# Запустить в режиме разработки
npm run dev

# Или запустить в production режиме
npm start
```

### Запуск на сервере с PM2

```bash
# Установить зависимости
npm install --production

# Запустить через PM2
pm2 start app.js --name "neetrino-server"

# Сохранить конфигурацию
pm2 save
```

## 📡 API Endpoints

- `GET /` - Главная страница с информацией о сервере
- `GET /health` - Проверка здоровья сервера
- `GET /api/info` - Информация о сервере и окружении

## ⚙️ Переменные окружения

Создайте файл `.env`:

```
NODE_ENV=production
PORT=3000
```

## 🛠️ Технологии

- Node.js
- Express.js
- PM2 (для продакшена)

## 📝 Лицензия

MIT

