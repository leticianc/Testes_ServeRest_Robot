* Settings *
Documentation       Arquivo de testes para endpoint /carrinhos
Resource            ../keywords/carrinhos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C32: GET Listar Carrinhos 200
    [tags]      GETCARRINHOS200
    GET Endpoint /carrinhos
    Validar Status Code "200"
    Printar Resposta
    Validar Quantidade "${1}" 

Cenario C33: GET Buscar Carrinho Por ID 
    [tags]      GETCARRINHOSID200
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico e Armazenar ID
    GET Endpoint /carrinhos/{_id}
    Validar Status Code "200"
    Printar Resposta
    DELETE Endpoint /carrinhos/cancelar-compra

Cenario C34: GET Buscar Carrinho Por ID 400
    [tags]      GETCARRINHOSID400
    GET Endpoint /carrinhos/{_id}
    Validar Status Code "400"
    Validar Mensagem "Carrinho não encontrado"

Cenario C35: POST Cadastrar Carrinho 201
    [tags]      POSTCARRINHOS201
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico e Armazenar ID
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    DELETE Endpoint /carrinhos/cancelar-compra
    #Verificar a redução da quantidade do produto no estoque

Cenario C36: POST Carrinho Produto Duplicado 400 
    [tags]      POSTDUPLICADO400
    Fazer Login e Armazenar Token
    POST Carrinho Produto Duplicado
    Validar Status Code "400"
    Validar Mensagem "Não é permitido possuir produto duplicado"

Cenario C37: POST Mais de Um Carrinho 400 
    [tags]      POSTMAISDEUM400
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico e Armazenar ID
    Criar Carrinho Estatico
    Validar Status Code "400"
    Validar Mensagem "Não é permitido ter mais de 1 carrinho"
    DELETE Endpoint /carrinhos/cancelar-compra

Cenario C38: POST Carrinho Com Quantidade Insuficiente 400 
    [tags]      POSTQUANTIDADE400
    Fazer Login e Armazenar Token
    POST Carrinho Com Quantidade Insuficiente
    Validar Status Code "400"
    Validar Mensagem "Produto não possui quantidade suficiente"

Cenario C39: POST Carrinho Produto Não Encontrado 400 
    [tags]      POSTNAOENCONTRADO400
    Fazer Login e Armazenar Token
    POST Carrinho Invalido
    Validar Status Code "400"
    Validar Mensagem "Produto não encontrado"

Cenario C40: POST Cadastrar Carrinho 401
    [tags]      POSTCARRINHOS401
    POST Endpoint /carrinhos Sem Token
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    
Cenario C41: DELETE Excluir Carrinho Concluido 200
    [tags]      DELETECARRINHOCONCLUIDO200
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"
    DELETE Endpoint /usuarios

Cenario C42: DELETE Excluir Carrinho Concluido 401
    [tags]      DELETECARRINHOCONCLUIDO401
    DELETE Endpoint /carrinhos/concluir-compra Sem Token
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario C43: DELETE Excluir Carrinho Cancelado 200      #mensagem "diferente" da documentação
    [tags]      DELETECARRINHOCANCELADO200
    Criar Usuario Dinamico e Armazenar ID
    Criar Carrinho Estatico
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenario C44: DELETE Excluir Carrinho Cancelado 401
    DELETE Endpoint /carrinhos/cancelar-compra Sem Token
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

#Deletando Pela ID
#    [tags]      DELETE
#    POST Endpoint /login User Rapido
#   DELETE Endpoint /carrinhos/cancelar-compra