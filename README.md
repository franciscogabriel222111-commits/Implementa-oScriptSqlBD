# Sistema de Cursos Online - Plataforma EAD
- **Disciplina:** Banco de Dados I - 2025.2
- **Professor:** João Paulo.
- **Equipe:** Francisco Gabriel, Ivo da Silva, Marcos Henrique e Ray William [cite: 113, 114, 115, 116]

## 🚀 Sobre o Projeto
- Este sistema gerencia o conteúdo educacional e a experiência de aprendizado, organizando a oferta de cursos e acompanhando o progresso dos alunos.

## 🛠️ Requisitos da 3ª Entrega Implementados
- **Script SQL:** Localizado em `/sql/bd_cursos.sql`.
- **Padrão DAO:** Implementado no arquivo `aluno_dao.py`.
- **CRUD Completo:** Funções de Criar, Listar, Atualizar e Deletar na entidade Aluno.
- **Consultas Avançadas (Requisito 8):** Uso de **JOIN** e **GROUP BY** para relatórios de matrículas.

## 📦 Como Executar
1. Instale o driver do PostgreSQL: `pip install psycopg2`.
2. Execute o script SQL no seu SGBD local para criar as tabelas.
3. Configure as credenciais em `src/conexao.py`.
4. Rode o sistema com: `python src/main.py`.