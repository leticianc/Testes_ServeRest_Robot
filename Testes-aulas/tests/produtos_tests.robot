* Settings *
Documentation       Arquivo de testes para endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario: POST Criar Produto 201
    [tags]      POSTPRODUTO
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTO
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"