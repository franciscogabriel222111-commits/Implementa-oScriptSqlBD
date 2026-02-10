from aluno_dao import AlunoDAO

def main():
    dao = AlunoDAO()

    while True:
        print("\n--- SISTEMA CURSOS ONLINE ---")
        print("1. Inserir Aluno")
        print("2. Listar Alunos")
        print("3. Atualizar Aluno")
        print("4. Deletar Aluno")
        print("5. Relatório (Requisito JOIN/GROUP BY)")
        print("0. Sair")
        
        opcao = input("Escolha: ")

        if opcao == '1':
            nome = input("Nome: ")
            email = input("Email: ")
            senha = input("Senha: ")
            dao.criar({'nome': nome, 'email': email, 'senha': senha})
        
        elif opcao == '2':
            alunos = dao.listar_todos()
            for a in alunos:
                print(f"ID: {a[0]} | Nome: {a[1]} | Email: {a[2]}")

        elif opcao == '3':
            id_a = input("ID do aluno para editar: ")
            novo_nome = input("Novo nome: ")
            dao.atualizar(id_a, novo_nome)

        elif opcao == '4':
            id_a = input("ID do aluno para deletar: ")
            dao.deletar(id_a)
            
        elif opcao == '5':
            print("\n--- RELATÓRIO DE MATRÍCULAS POR ALUNO ---")
            dados = dao.relatorio_matriculas()
            for linha in dados:
                print(f"Aluno: {linha[0]} | Total de Cursos: {linha[1]}")

        elif opcao == '0':
            break

if __name__ == "__main__":
    main()