* Settings *
Documentation       Arquivo de testes para endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C16: GET Listar Produtos 200
    [tags]      GETPRODUTOS200
    GET Endpoint /produtos
    Validar Status Code "200"
    Validar Quantidade "${2}"    

Cenario C17: GET Buscar Produto Por ID 200
    [tags]      GETPRODUTOSID200
    Fazer Login e Armazenar Token
    Criar Produto Estatico e Armazenar ID
    GET Endpoint produtos/{_id}
    Validar Status Code "200"
    DELETE Endpoint /produtos

Cenario C18: GET Buscar Produto Por ID 400
    [tags]      GETPRODUTOSID400
    GET Endpoint produtos/{_id}
    Validar Status Code "400"
    Validar Mensagem "Produto não encontrado"

Cenario C19: POST Cadastrar Produto 201
    [tags]      POSTPRODUTOS201
    Fazer Login e Armazenar Token
    Criar Produto Estatico e Armazenar ID
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    DELETE Endpoint /produtos

Cenario C20: POST Cadastrar Produto 400
    [tags]      POSTPRODUTOS400
    Fazer Login e Armazenar Token
    POST Produto Existente
    Validar Status Code "400"
    Validar Mensagem "Já existe produto com esse nome"

Cenario C21: POST Cadastrar Produto 401
    [tags]      POSTPRODUTOS401
    POST Endpoint /produtos Sem Token
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario C22: POST Cadastrar Produto 403
    [tags]      POSTPRODUTOS403
    Fazer Login Não Administrador e Armazenar Token
    Criar Produto Estatico
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"

Cenario C23: PUT Editar Produto 200
    [tags]      PUTPRODUTOS200
    Fazer Login e Armazenar Token
    Criar Produto Estatico e Armazenar ID
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar mensagem "Registro alterado com sucesso"    
    DELETE Endpoint /produtos

Cenario C24: PUT Editar Produto 201
    [tags]      PUTPRODUTOS201
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos Cadastro
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso" 
    DELETE Endpoint /produtos

Cenario C25: PUT Editar Produto 400
    [tags]      PUTPRODUTOS400
    Fazer Login e Armazenar Token
    PUT Endpoint /usuarios Invalido
    Validar Status Code "400"
    Validar Mensagem "Já existe produto com esse nome"

Cenario C26: PUT Editar Produto 401
    [tags]      PUTPRODUTOS401
    PUT Endpoint /produtos Sem Token
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario C27: PUT Editar Produto 403
    [tags]      PUTPRODUTOS403
    Fazer Login Não Administrador e Armazenar Token
    PUT Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"

Cenario C28: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTOS200
    Fazer Login e Armazenar Token    
    Criar Produto Estatico e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"

#Cenario C29: DELETE Excluir Produto 400
    #carrinho

Cenario C30: DELETE Excluir Produto 401
    [tags]      DELETEPRODUTOS401
    DELETE Endpoint /produtos Sem Token
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario C31: DELETE Excluir Produto 403
    [tags]      DELETEPRODUTOS403
    Fazer Login Não Administrador e Armazenar Token
    DELETE Endpoint /produtos
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"

Deletando Pela ID
    [tags]      DELETE
    Fazer Login e Armazenar Token
    Deletar Pela ID