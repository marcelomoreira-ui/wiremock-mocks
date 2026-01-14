#!/bin/bash

echo "🚀 Subindo WireMock via Docker..."

docker compose up -d

if [ $? -eq 0 ]; then
  echo "✅ WireMock iniciado com sucesso"
  echo "📍 Endpoint: http://localhost:8089"
  echo "⚙️ Admin API: http://localhost:8089/__admin"
else
  echo "❌ Erro ao subir o WireMock"
  exit 1
fi