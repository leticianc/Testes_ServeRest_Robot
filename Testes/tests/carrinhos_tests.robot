* Settings *
Documentation       Arquivo de testes para endpoint /carrinhos
Resource            ../keywords/carrinhos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C32: GET Listar Carrinhos 200
    [tags]      GETCARRINHOS200
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario C33: GET Buscar Carrinho Por ID 
    [tags]      GETCARRINHOSID200
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico e Armazenar ID
    GET Endpoint /carrinhos/{_id}
    Validar Status Code "200"
    DELETE Endpoint /carrinhos

#Cenario C34: GET Buscar Carrinho Por ID 400

Cenario C35: POST Cadastrar Carrinho 201
    [tags]      POSTCARRINHOS201
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico e Armazenar ID
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    #Verificar a redução da quantidade do produto no estoque

#Cenario C36: POST Cadastrar Carrinho 400 

#Cenario C37: POST Cadastrar Carrinho 401

Cenario C38: DELETE Excluir Carrinho Concluido 200  #mensagem "diferente" da documentação
    [tags]      DELETECARRINHOCONCLUIDO200
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso. Estoque dos produtos reabastecido"


#Cenario C39: DELETE Excluir Carrinho Concluido 401

Cenario C40: DELETE Excluir Carrinho Cancelado 200
    [tags]      DELETECARRINHOCANCELADO200
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso. Estoque dos produtos reabastecido"

    
    
#Cenario C41: DELETE Excluir Carrinho Cancelado 401

Deletando Pela ID
    [tags]      DELETE
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos