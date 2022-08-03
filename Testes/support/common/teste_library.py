import json

def Buscar_Login(algo):
    with open ("./support/fixtures/static/login.json", encoding="utf-8") as json_login:
        login = json.load(json_login)
        dado = (login[algo])
    return dado


def Buscar_Usuario(algo):
    with open ("./support/fixtures/static/usuarios.json", encoding="utf-8") as json_usuarios:
        usuario = json.load(json_usuarios)
        dado = (usuario[algo])
    return dado


def Buscar_Produto(algo):
    with open ("./support/fixtures/static/produtos.json", encoding="utf-8") as json_produtos:
        produto = json.load(json_produtos)
        dado = (produto[algo])
    return dado


def Buscar_Carrinho(algo):
    with open ("./support/fixtures/static/carrinhos.json", encoding="utf-8") as json_carrinhos:
        carrinho = json.load(json_carrinhos)
        dado = (carrinho[algo])
    return dado


def Subtrair(a, b):
    resultado = a - b
    return resultado
