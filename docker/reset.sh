#!/bin/bash

WIREMOCK_URL="http://localhost:8089/__admin"

echo "🔄 Resetando estado do WireMock..."

# Remove stubs criados dinamicamente
curl -s -X POST "$WIREMOCK_URL/mappings/reset"

# Reseta cenários
curl -s -X POST "$WIREMOCK_URL/scenarios/reset"

echo "✅ WireMock resetado com sucesso"