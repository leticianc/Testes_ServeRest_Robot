* Settings *
Documentation       Arquivo de testes para endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C21: GET Listar Produtos 200
    [tags]      C21
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario C22: GET Buscar Produto Por ID 200
    [tags]      C22
    Fazer Login Com Usuario Dinamico
    Criar Produto Dinamico
    GET Endpoint produtos/{_id}
    Mostrar Response
    Validar Status Code "200"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenario C23: GET Buscar Produto Com ID Invalida 400
    [tags]      C23
    Definir ID Produto Inválida
    GET Endpoint produtos/{_id}
    Validar Mensagem "Produto não encontrado"
    Validar Status Code "400"    

Cenario C24: POST Cadastrar Produto 201
    [tags]      C24
    Fazer Login Com Usuario Dinamico
    Criar Produto Dinamico
    Mostrar Produto
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenario C25: POST Cadastrar Produto Com Nome Existente 400
    [tags]      C25
    Fazer Login Com Usuario Dinamico
    POST Produto "Com_Nome_Existente"
    Mostrar payload
    Validar Mensagem "Já existe produto com esse nome"   
    Validar Status Code "400"
    DELETE Endpoint /usuarios

Cenario C26: POST Cadastrar Produto Sem Nome
    [tags]      C26
    Fazer Login Com Usuario Dinamico
    POST Produto "Sem_Nome"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C27: POST Cadastrar Produto Sem Preco
    [tags]      C27
    Fazer Login Com Usuario Dinamico
    POST Produto "Sem_Preco"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C28: POST Cadastrar Produto Sem Descrição
    [tags]      C28
    Fazer Login Com Usuario Dinamico
    POST Produto "Sem_Descricao"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C29: POST Cadastrar Produto Sem Quantidade
    [tags]      C29
    Fazer Login Com Usuario Dinamico
    POST Produto "Sem_Quantidade"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C30: POST Cadastrar Produto Token Excluido 401
    [tags]      C30
    Fazer Login Com Usuario Dinamico
    DELETE Endpoint /usuarios
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenario C31: POST Cadastrar Produto Token Invalido 401
    [tags]      C31
    Definir Token Invalido
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenario C32: POST Cadastrar Produto Sem Ser Administrador 403
    [tags]      C32
    Fazer Login Usuario Não Administrador
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Mensagem "Rota exclusiva para administradores"
    Validar Status Code "403"
    DELETE Endpoint /usuarios

Cenario C33: PUT Editar Produto 200
    [tags]      C33
    Fazer Login Com Usuario Dinamico
    Criar Produto Dinamico
    Mostrar Produto
    PUT Endpoint /produtos
    Mostrar Produto
    Validar Mensagem "Registro alterado com sucesso" 
    Validar Status Code "200"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenario C34: PUT Editar Novo Produto 201
    [tags]      C34
    Fazer Login Com Usuario Dinamico
    Definir ID Produto Inválida
    PUT Endpoint /produtos
    Armazenar ID Produto
    Validar Mensagem "Cadastro realizado com sucesso" 
    Validar Status Code "201"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios
    
Cenario C35: PUT Editar Novo Produto Com Nome Existente 400
    [tags]      C35
    Fazer Login Com Usuario Dinamico
    Definir ID Produto Inválida
    PUT Endpoint /produtos Existente
    Mostrar Payload
    Validar Mensagem "Já existe produto com esse nome" 
    Validar Status Code "400"
    DELETE Endpoint /usuarios

Cenario C36: PUT Editar Produto Sem Token 401
    [tags]      C36
    Definir Token Invalido
    Definir ID Produto Valida
    Criar Dados Produto Valido
    PUT Endpoint /produtos
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"    

Cenario C37: PUT Editar Produto Sem Ser Administrador 403
    [tags]      C37
    Fazer Login Usuario Não Administrador
    Definir ID Produto Valida
    Criar Dados Produto Valido
    PUT Endpoint /produtos
    Validar Mensagem "Rota exclusiva para administradores"
    Validar Status Code "403"
    DELETE Endpoint /usuarios

Cenario C38: DELETE Excluir Produto 200
    [tags]      C38
    Fazer Login Com Usuario Dinamico
    Criar Produto Dinamico    
    DELETE Endpoint /produtos
    Validar Mensagem "Registro excluído com sucesso"
    Validar Status Code "200"
    Verificar Se Produto Foi Deletado
    DELETE Endpoint /usuarios

Cenario C39: DELETE Excluir Produto em Carrinho 400
    [tags]      C39
    Criar Carrinho Dinamico
    DELETE Endpoint /produtos
    Validar Mensagem "Não é permitido excluir produto que faz parte de carrinho"
    Validar Status Code "400"
    Deletar Dados da Base

Cenario C40: DELETE Excluir Produto Sem Token 401
    [tags]      C40
    Definir Token Invalido
    Definir ID Produto Valida
    DELETE Endpoint /produtos
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenario C41: DELETE Excluir Produto Sem Ser Administrador 403
    [tags]      C41
    Fazer Login Usuario Não Administrador
    Definir ID Produto Valida
    DELETE Endpoint /produtos
    Validar Mensagem "Rota exclusiva para administradores"
    Validar Status Code "403"
    DELETE Endpoint /usuarios