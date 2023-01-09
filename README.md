# Rebase Labs

Uma app web para listagem de exames médicos desenvolvida como parte de um laboratório oferecido pela Rebase à turma 9 do Treinadev.

## Tech Stack

* Docker
* Ruby
* Javascript
* HTML
* CSS

## Como rodar a aplicação

No terminal, clone o projeto:

```
git clone git@github.com:RaphaellyV/rebase-labs.git
```

Entre na pasta do projeto:

```
cd rebase-labs
```

Inicie a app:

```
docker compose up -d
```

Para derrubar a app:

```
docker compose down
```

## Como rodar os testes

```
docker compose exec app rspec
```

Atualmente a app possui somente um banco de dados, então a execução dos testes irá deletar o conteúdo da tabela de exames realizados, sendo necessário repopulá-la.

## Como importar os dados dos exames realizados

Os dados dos exames realizados estão contidos em um arquivo CSV, que pode ser importado para o banco de dados da app de duas maneiras:

- Comando:

```
docker compose exec app ruby import_csv.rb
```

- Endpoint:

Request:
```
POST /import?file=./spec/support/tests.csv
```

## Endpoint para obter lista de exames realizados

Os dados estarão disponíveis após sua importação (realizada no item anterior).

Request:
```
GET /tests
```

Response:

```json
[
  {
    "id": "838157",
    "patient_registration_number": "048.973.170-88",
    "patient_name": "Emilly Batista Neto",
    "patient_email": "gerald.crona@ebert-quigley.com",
    "patient_birth_date": "2001-03-11",
    "patient_address": "165 Rua Rafaela",
    "patient_city": "Ituverava",
    "patient_state": "Alagoas",
    "doctor_crm": "B000BJ20J4",
    "doctor_crm_state": "PI",
    "doctor_name": "Maria Luiza Pires",
    "doctor_email": "denna@wisozk.biz",
    "test_token": "IQCZ17",
    "test_date": "2021-08-05",
    "test_type": "hemácias",
    "test_limits": "45-52",
    "test_result": "97"
  },
  {
    "id": "838158",
    "patient_registration_number": "048.973.170-88",
    "patient_name": "Emilly Batista Neto",
    "patient_email": "gerald.crona@ebert-quigley.com",
    "patient_birth_date": "2001-03-11",
    "patient_address": "165 Rua Rafaela",
    "patient_city": "Ituverava",
    "patient_state": "Alagoas",
    "doctor_crm": "B000BJ20J4",
    "doctor_crm_state": "PI",
    "doctor_name": "Maria Luiza Pires",
    "doctor_email": "denna@wisozk.biz",
    "test_token": "IQCZ17",
    "test_date": "2021-08-05",
    "test_type": "leucócitos",
    "test_limits": "9-61",
    "test_result": "89"
  },
  {
    "id": "838159",
    "patient_registration_number": "048.108.026-04",
    "patient_name": "Juliana dos Reis Filho",
    "patient_email": "mariana_crist@kutch-torp.com",
    "patient_birth_date": "1995-07-03",
    "patient_address": "527 Rodovia Júlio",
    "patient_city": "Lagoa da Canoa",
    "patient_state": "Paraíba",
    "doctor_crm": "B0002IQM66",
    "doctor_crm_state": "SC",
    "doctor_name": "Maria Helena Ramalho",
    "doctor_email": "rayford@kemmer-kunze.info",
    "test_token": "0W9I67",
    "test_date": "2021-07-09",
    "test_type": "hemácias",
    "test_limits": "45-52",
    "test_result": "28"
  },
  {
    "id": "838160",
    "patient_registration_number": "048.108.026-04",
    "patient_name": "Juliana dos Reis Filho",
    "patient_email": "mariana_crist@kutch-torp.com",
    "patient_birth_date": "1995-07-03",
    "patient_address": "527 Rodovia Júlio",
    "patient_city": "Lagoa da Canoa",
    "patient_state": "Paraíba",
    "doctor_crm": "B0002IQM66",
    "doctor_crm_state": "SC",
    "doctor_name": "Maria Helena Ramalho",
    "doctor_email": "rayford@kemmer-kunze.info",
    "test_token": "0W9I67",
    "test_date": "2021-07-09",
    "test_type": "leucócitos",
    "test_limits": "9-61",
    "test_result": "91"
  }
]
```

## Como acessar o front-end HTML da tabela de exames 

Os dados estarão disponíveis após sua importação inicial em http://localhost:3000/tests-table.
