* Settings *
Documentation       Arquivo de testes para endpoint /carrinhos
Resource            ../keywords/carrinhos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C42: GET Listar Carrinhos 200
    [tags]      C42
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario C43: GET Buscar Carrinho Por ID 
    [tags]      C43
    Criar Carrinho Dinamico
    GET Endpoint carrinhos/{_id}
    Mostrar Response
    Validar Status Code "200"
    Deletar Dados da Base

Cenario C44: GET Buscar Carrinho Com ID Invalida 400
    [tags]      C44
    Definir ID Carrinho Inválida
    GET Endpoint carrinhos/{_id}
    Validar Mensagem "Carrinho não encontrado"
    Validar Status Code "400" 

Cenario C45: POST Cadastrar Carrinho 201
    [tags]      C45
    Criar Carrinho Dinamico
    Mostrar Carrinho
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Status Code "201"
    Deletar Dados da Base

Cenario C46: POST Carrinho Produto Duplicado 400 
    [tags]      C46
    Fazer Login Com Usuario Dinamico
    POST Carrinho Duplicado
    Mostrar Payload
    Validar Mensagem "Não é permitido possuir produto duplicado"
    Validar Status Code "400"
    DELETE Endpoint /usuarios

Cenario C47: POST Mais de Um Carrinho 400
    [tags]      C47
    Criar Carrinho Dinamico
    Mostrar Carrinho
    Criar Dados Carrinho Valido
    Mostrar Payload
    POST Endpoint /carrinhos
    Validar Mensagem "Não é permitido ter mais de 1 carrinho"
    Validar Status Code "400"
    Deletar Dados da Base

Cenario C48: POST Carrinho Com Quantidade Insuficiente 400 
    [tags]      C48
    Fazer Login Com Usuario Dinamico
    POST Carrinho Quantidade Insuficiente
    Mostrar Payload
    Validar Mensagem "Produto não possui quantidade suficiente"
    Validar Status Code "400"
    DELETE Endpoint /usuarios

Cenario C49: POST Carrinho Produto Não Encontrado 400
    [tags]      C49
    Fazer Login Com Usuario Dinamico
    POST Carrinho Com Produto Invalido
    Mostrar Payload
    Validar Mensagem "Produto não encontrado"
    Validar Status Code "400"
    DELETE Endpoint /usuarios
    
Cenario C50: POST Cadastrar Carrinho Sem Token 401
    [tags]      C50
    Definir Token Invalido
    Definir ID Produto Valida
    Criar Dados Carrinho Valido
    POST Endpoint /carrinhos
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenario C51: DELETE Excluir Carrinho Concluido 200
    [tags]      C51
    Criar Carrinho Dinamico
    Mostrar Carrinho
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Mensagem "Registro excluído com sucesso"
    Validar Status Code "200"
    Verificar Se Carrinho Foi Deletado
    Verificar Se Quantidade Foi Alterada
    Deletar Dados da Base

Cenario C52: DELETE Excluir Carrinho Concluido Sem Token 401
    [tags]      C52
    Definir Token Invalido
    Definir ID Carrinho Valida
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenario C53: DELETE Excluir Carrinho Cancelado 200
    [tags]      C53
    Criar Carrinho Dinamico
    Mostrar Carrinho
    DELETE Endpoint /carrinhos/cancelar-compra
    Comparar Mensagem "Registro excluído com sucesso"
    Validar Status Code "200"
    Verificar Se Carrinho Foi Deletado
    Verificar Se Quantidade Foi Reestabelecida
    Deletar Dados da Base

Cenario C54: DELETE Excluir Carrinho Cancelado Sem Token 401
    [tags]      C54
    Definir Token Invalido
    Definir ID Carrinho Valida
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"