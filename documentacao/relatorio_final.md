# Relatório de Implementação - Sistema de Cursos Online (EAD)
**Disciplina:** Banco de Dados I - 2025.2
**Professor:** João Paulo
**Equipe:** Francisco Gabriel, Ivo da Silva, Marcos Henrique e Ray William 

## 1. Introdução
Este documento detalha a terceira entrega do projeto, que consistiu na implementação prática do sistema em Python integrado ao PostgreSQL. O objetivo principal foi gerenciar o conteúdo educacional e o progresso dos alunos através de uma aplicação CRUD estruturada no padrão DAO.

## 2. Tecnologias Utilizadas
* **Linguagem:** Python 3.
* **Banco de Dados:** PostgreSQL (versão 18.1).
* **Driver de Conexão:** psycopg2.
* **Padrão de Projeto:** DAO (Data Access Object).

## 3. Requisitos Atendidos (Item 8 da Entrega)
Para atender às exigências da avaliação, o sistema realiza consultas avançadas no PostgreSQL:
- **JOIN:** Utilizado para vincular as tabelas Aluno, Matricula e Curso no relatório de progresso.
- **GROUP BY:** Utilizado em conjunto com funções de agregação (COUNT) para contabilizar o número de cursos por aluno.

## 4. Visualização de Documentos
Os diagramas de modelagem conceitual e relacional estão anexados nesta pasta em formato PDF.
> **Nota:** Para visualizar os arquivos PDF diretamente no ambiente de desenvolvimento, recomenda-se o uso da extensão **vscode-pdf** no VS Code.

---