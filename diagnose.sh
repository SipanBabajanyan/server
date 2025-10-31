#!/bin/bash

echo "=========================================="
echo "🔍 Диагностика Nginx и Node.js"
echo "=========================================="
echo ""

echo "1️⃣ Проверка активных конфигураций Nginx:"
echo "----------------------------------------"
ls -la /etc/nginx/sites-enabled/
echo ""

echo "2️⃣ Содержимое конфигурации server.neetrino.com:"
echo "----------------------------------------"
cat /etc/nginx/sites-available/server.neetrino.com 2>/dev/null || echo "Файл не найден!"
echo ""

echo "3️⃣ Проверка статуса Nginx:"
echo "----------------------------------------"
systemctl status nginx --no-pager | head -15
echo ""

echo "4️⃣ Проверка конфигурации Nginx:"
echo "----------------------------------------"
nginx -t
echo ""

echo "5️⃣ Статус PM2:"
echo "----------------------------------------"
pm2 status
echo ""

echo "6️⃣ Проверка Node.js приложения:"
echo "----------------------------------------"
curl -s http://localhost:3000 | head -3
echo ""
echo ""

echo "7️⃣ Проверка через Nginx (localhost):"
echo "----------------------------------------"
curl -s http://localhost | head -10
echo ""

echo "8️⃣ Проверка через Nginx с Host header:"
echo "----------------------------------------"
curl -s -H "Host: server.neetrino.com" http://localhost | head -10
echo ""

echo "9️⃣ Порты в использовании:"
echo "----------------------------------------"
netstat -tlnp | grep -E ':(80|3000)' || ss -tlnp | grep -E ':(80|3000)'
echo ""

echo "🔟 Логи Nginx (последние 5 строк):"
echo "----------------------------------------"
tail -5 /var/log/nginx/access.log 2>/dev/null || echo "Лог не найден"
echo ""

echo "✅ Диагностика завершена!"
echo "=========================================="

