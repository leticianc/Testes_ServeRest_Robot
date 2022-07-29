* Settings *
Documentation       Arquivo de testes para endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C21: GET Listar Produtos 200
    [tags]      C21
    GET Endpoint /produtos
    Mostrar Resposta
    Validar Status Code "200"

Cenario C22: GET Buscar Produto Por ID 200
    [tags]      C22
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    Criar Produto Dinamico
    GET Endpoint produtos/{_id}
    Mostrar Resposta
    Validar Status Code "200"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenario C23: GET Buscar Produto Com ID Invalida 400
    GET Endpoint produtos/{_id}
    Validar Mensagem "Produto não encontrado"
    Validar Status Code "400"

Cenario C24: POST Cadastrar Produto 201
    [tags]      C24
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    Criar Produto Dinamico
    Mostrar Produto
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenario C25: POST Cadastrar Produto Com Nome Existente 400
    [tags]      C25
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    POST Produto "Com_Nome_Existente"
    Mostrar payload
    Validar Mensagem "Já existe produto com esse nome"   
    Validar Status Code "400" 
    DELETE Endpoint /usuarios

Cenario C26: POST Cadastrar Produto Sem Nome
    [tags]      C26
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    POST Produto "Sem_Nome"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C27: POST Cadastrar Produto Sem Preco
    [tags]      C27
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    POST Produto "Sem_Preco"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C28: POST Cadastrar Produto Sem Descrição
    [tags]      C28
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    POST Produto "Sem_Descricao"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C29: POST Cadastrar Produto Sem Quantidade
    [tags]      C29
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    POST Produto "Sem_Quantidade"
    Mostrar payload
    Mostrar Resposta
    DELETE Endpoint /usuarios

Cenario C30: POST Cadastrar Produto Token Excluido 401
    [tags]      C30
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    DELETE Endpoint /usuarios
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenario C31: POST Cadastrar Produto Token Invalido 401
    [tags]      C31
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"

Cenario C32: POST Cadastrar Produto 403
    [tags]      C32
    Criar Usuario Não Administrador e Armazenar Dados
    POST Endpoint /login
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Mensagem "Rota exclusiva para administradores"
    Validar Status Code "403"
    DELETE Endpoint /usuarios     