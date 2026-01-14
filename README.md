# 🧪 WireMock – Mock de Serviços Backend

Este projeto tem como objetivo disponibilizar **mocks de serviços backend** utilizando **WireMock via Docker**, permitindo testes de qualidade (QA) de forma **isolada, previsível e reutilizável** ao longo do tempo.

---

## 🎯 Objetivo

* Simular dependências externas de microserviços backend
* Permitir testes:

  * Funcionais
  * Integração
  * End-to-End (E2E)
* Evitar dependência de ambientes instáveis
* Facilitar testes de cenários de erro, timeout e retry

---

## 🧱 Tecnologias utilizadas

* **WireMock** (Standalone – Java)
* **Docker**
* **Docker Compose**

> ⚠️ Não é necessário instalar Java ou Node.js localmente.

---

## 📁 Estrutura do projeto

```text
wiremock-mocks/
├── docker/
│   ├── docker-compose.yml
│   ├── start.sh
│   └── reset.sh
├── mappings/
│   ├── service-a/
│   └── service-b/
├── files/
│   ├── service-a/
│   └── service-b/
└── README.md
```

### 📂 mappings/

Contém os **stubs (mapeamentos)** do WireMock.
Define **quando** e **como** o WireMock deve responder.

📌 Um arquivo por endpoint/cenário.

---

### 📂 files/

Contém os **payloads de response** utilizados pelos stubs.
Nenhuma lógica deve ficar aqui — apenas JSONs de resposta.

📌 Os caminhos são relativos à pasta `files/`.

---

## ⚙️ Pré-requisitos

Antes de iniciar, certifique-se de ter instalado:

* Docker
* Docker Compose

Verificação rápida:

```bash
docker --version
docker compose version
```

---

## ▶️ Como subir o WireMock

### 1️⃣ Acesse a pasta `docker`

```bash
cd docker
```

### 2️⃣ Suba o container

```bash
./start.sh
```

Ou, se preferir:

```bash
docker compose up -d
```

---

## 🌐 Endpoints disponíveis

| Tipo        | URL                                                                          |
| ----------- | ---------------------------------------------------------------------------- |
| Mock API    | [http://localhost:8089](http://localhost:8089)                               |
| Admin API   | [http://localhost:8089/__admin](http://localhost:8089/__admin)               |
| Healthcheck | [http://localhost:8089/__admin/health](http://localhost:8089/__admin/health) |

---

## 🔄 Resetando o estado do WireMock

Para limpar cenários e stubs dinâmicos entre execuções de teste:

```bash
./reset.sh
```

📌 Recomendado:

* Antes de suítes E2E
* Antes de pipelines CI
* Após testes com `scenarioName`

---

## 🧪 Exemplos de serviços mockados

### 🔹 Service A

* `GET /customers/123`

### 🔹 Service B

* `GET /orders`

> Consulte os arquivos dentro de `mappings/` para mais detalhes.

---

## ➕ Como adicionar um novo stub

1️⃣ Crie o mapping:

```text
mappings/service-b/get-orders-200.json
```

2️⃣ Crie o payload de response:

```text
files/service-b/orders-response.json
```

3️⃣ Teste o endpoint:

```
http://localhost:8089/orders
```

📌 Não é necessário reiniciar o container.

---

## ⚠️ Boas práticas

* ✔️ Um stub por arquivo
* ✔️ Nomear arquivos de forma clara (`metodo-endpoint-status.json`)
* ✔️ Separar mappings por serviço
* ✔️ Versionar tudo em Git
* ❌ Não editar arquivos dentro do container
* ❌ Não mockar o serviço sob teste

---

## 🐞 Troubleshooting

### ❌ Endpoint não responde

* Verifique se o mapping está correto
* Confirme o `urlPath`
* Confira os logs:

```bash
docker logs wiremock
```

---

### ❌ Payload não encontrado

Erro comum:

```text
FileNotFoundException
```

✔️ Verifique o `bodyFileName`
✔️ O caminho é relativo à pasta `files/`

---

## 🚀 Evoluções futuras

Este projeto pode evoluir para:

* Simulação de timeout e retry
* Circuit breaker
* Contract testing (Pact / OpenAPI)
* Integração com CI/CD
* Versionamento por release

---

## 👥 Público-alvo

* QA
* Desenvolvedores
* Times de Integração
* CI/CD

---

## 📌 Observações finais

Este projeto deve ser tratado como **infraestrutura de teste**
e não como código de aplicação.

---

Licença

-------

Este repositório não possui uma licença explícita. Adicione um arquivo `LICENSE` se quiser definir termos.
