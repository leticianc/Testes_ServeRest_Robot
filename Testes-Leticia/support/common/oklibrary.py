import json

def Buscar_Login(algo):
    dado = "0"
    with open ("./support/fixtures/static/login.json", encoding="utf-8") as json_login:
        login = json.load(json_login)
        if algo == "Email_Invalido":
            dado = (login["emailinvalido"])
        elif algo == "Senha_Invalida":
            dado = (login["senhainvalida"])
        elif algo == "Sem_Email":
            dado = (login["sememail"])
        elif algo == "Sem_Senha":
            dado = (login["semsenha"])
        elif algo == "Sem_Dados":
            dado = (login["vazio"])
    return dado


def Buscar_Usuario(algo):
    dado = 0
    with open ("./support/fixtures/static/usuarios.json", encoding="utf-8") as json_usuarios:
        usuario = json.load(json_usuarios)
        if algo == "Sem_Nome":
            dado = (usuario["semnome"])
        elif algo == "Sem_Email":
            dado = (usuario["sememail"])
        elif algo == "Sem_Senha":
            dado = (usuario["semsenha"])
        elif algo == "Sem_Administrador":
            dado = (usuario["semadmin"])
        elif algo == "Email_Cadastrado":
            dado = (usuario["user_invalido"])
    return dado


def Buscar_Produto(algo):
    dado = 0
    with open ("./support/fixtures/static/produtos.json", encoding="utf-8") as json_produtos:
        produto = json.load(json_produtos)
        if algo == "Com_Nome_Existente":
            dado = (produto["produto_existente"])
        elif algo == "Sem_Nome":
            dado = (produto["semnome"])
        elif algo == "Sem_Preco":
            dado = (produto["sempreco"])
        elif algo == "Sem_Descricao":
            dado = (produto["semdescricao"])
        elif algo == "Sem_Quantidade":
            dado = (produto["semquantidade"])
    return dado
