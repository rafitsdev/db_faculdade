# 📚 Faculdade Database

Este repositório contém os scripts SQL necessários para a criação, população e consulta de um banco de dados para um sistema acadêmico de faculdade.

## 📌 Estrutura do Repositório

- `structuring_db_faculdade.sql` → Criação das tabelas do banco de dados.
- `populating_db_faculdade.sql` → Inserção de dados fictícios nas tabelas.
- `queries_db_faculdade.sql` → Consultas SQL para análise e extração de informações.

---

## 🚀 Como Utilizar os Scripts

### 🔹 1. Configuração do Banco de Dados
Antes de executar os scripts, certifique-se de ter um **SGBD compatível** instalado, como MySQL ou MariaDB.

1. Abra seu terminal ou client SQL (como MySQL Workbench, DBeaver ou phpMyAdmin).
2. Crie um banco de dados para armazenar as tabelas:
   ```sql
   CREATE DATABASE faculdade;
   USE faculdade;
   ```

---

### 🔹 2. Executando a Estruturação do Banco
Agora, execute o script de estruturação para criar as tabelas:
   ```sh
   mysql -u seu_usuario -p faculdade < structuring_db_faculdade.sql
   ```
Ou, caso esteja em um client gráfico, basta importar e rodar o arquivo `structuring_db_faculdade.sql`.

---

### 🔹 3. Populando o Banco de Dados
Após a estruturação, preencha o banco com dados fictícios:
   ```sh
   mysql -u seu_usuario -p faculdade < populating_db_faculdade.sql
   ```

---

### 🔹 4. Executando as Consultas
Com o banco de dados estruturado e populado, agora você pode rodar consultas SQL pré-definidas para obter informações relevantes:
   ```sh
   mysql -u seu_usuario -p faculdade < queries_db_faculdade.sql
   ```

Ou, se preferir, abra o arquivo `queries_db_faculdade.sql` em um editor de SQL e execute consultas específicas conforme necessário.

---

## 🛠 Tecnologias Utilizadas
- **MySQL** – Sistema de Gerenciamento de Banco de Dados
- **SQL** – Linguagem para manipulação de dados
- **GitHub** – Controle de versão e compartilhamento

---

## 📌 Contribuições
Se desejar sugerir melhorias ou reportar problemas, fique à vontade para abrir uma _issue_ ou enviar um _pull request_.

---

## 📜 Licença
Este projeto está sob a licença MIT.

---

✉️ **Contato:** [Seu Email ou LinkedIn]
