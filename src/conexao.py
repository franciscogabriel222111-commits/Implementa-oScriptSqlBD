import psycopg2

def criar_conexao():
    try:
        
        conn = psycopg2.connect(
            host="localhost",
            database="bd_cursos", 
            user="postgres",
            password="shottz"
        )
        return conn
    except Exception as e:
        print(f"Erro ao conectar: {e}")
        return None