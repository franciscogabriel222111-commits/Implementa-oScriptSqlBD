import psycopg2

def criar_conexao():
    try:
        
        conectar = psycopg2.connect(
            host="localhost",
            database="bd_cursos",
            user="postgres",
            password="shottz"
        )
        return conectar
    except Exception as e:
        print(f"Erro ao conectar: {e}")
        return None