from conexao import criar_conexao

class AlunoDAO:
    
    # C - CREATE
    def criar(self, aluno):
        conn = criar_conexao()
        cursor = conn.cursor()
        sql = "INSERT INTO ALUNO (nome, email, senha) VALUES (%s, %s, %s)"
        cursor.execute(sql, (aluno['nome'], aluno['email'], aluno['senha']))
        conn.commit()
        cursor.close()
        conn.close()
        print("Aluno cadastrado com sucesso!")

    # R - READ
    def listar_todos(self):
        conn = criar_conexao()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM ALUNO")
        alunos = cursor.fetchall()
        cursor.close()
        conn.close()
        return alunos

    # U - UPDATE
    def atualizar(self, id_aluno, novo_nome, novo_email, novo_senha):
        conn = criar_conexao()
        cursor = conn.cursor()
        sql = "UPDATE ALUNO SET nome = %s, email = %s, senha = %s WHERE id_aluno = %s"
        cursor.execute(sql, (novo_nome, novo_email, novo_senha, id_aluno))
        conn.commit()
        cursor.close()
        conn.close()
        print("Aluno atualizado com sucesso!")

    # D - DELETE
    def deletar(self, id_aluno):
        conn = criar_conexao()
        cursor = conn.cursor()
        sql = "DELETE FROM ALUNO WHERE id_aluno = %s"
        cursor.execute(sql, (id_aluno,))
        conn.commit()
        cursor.close()
        conn.close()
        print("Aluno removido!")

    # REQUISITO ESPECIAL: GROUP BY + JOIN
    # Conta quantos cursos cada aluno tem matriculado
    def relatorio_matriculas(self):
        conn = criar_conexao()
        cursor = conn.cursor()
        # Junta as tabelas Aluno e Matricula. Conta quantos cursos cada um tem.
        sql = """
        SELECT a.nome, COUNT(m.id_curso) as total_cursos
        FROM ALUNO a
        LEFT JOIN MATRICULA m ON a.id_aluno = m.id_aluno
        GROUP BY a.id_aluno, a.nome;
        """
        cursor.execute(sql)
        resultado = cursor.fetchall()
        cursor.close()
        conn.close()
        return resultado