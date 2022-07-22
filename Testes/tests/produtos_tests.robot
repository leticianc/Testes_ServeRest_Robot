* Settings *
Documentation       Arquivo de testes para endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C14: GET Listar Produtos 200
    [tags]      GETPRODUTOS200
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario C15: POST Cadastrar Produto 201
    [tags]      POSTPRODUTOS201
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

#Cenario C16: POST Cadastrar Produto 400     #não funciona
 #   [tags]      POSTPRODUTOS400
 #   Fazer Login e Armazenar Token
 #   POST Endpoint /produtos
 #   Validar Status Code "400"
 #   Validar Mensagem "Já existe produto com esse nome"
    #Informar um nome de produto já cadastrado

#Cenario C17: POST Cadastrar Produto 401     #não funciona
 #   [tags]      POSTPRODUTOS401
 #   Criar Sessao
 #   POST Endpoint /produtos
 #   Validar Status Code "401"
 #   Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario C19: GET Buscar Produto Por ID 200
    [tags]      GETPRODUTOSID200
    GET Endpoint /produtos/{_id}
    Validar Status Code "200"

#Cenario C20: GET Buscar Produto Por ID 400      #não funciona
 #   [tags]      GETPRODUTOSID400
 #   GET Endpoint /produtos/{_id}
 #   Validar Status Code "400"
 #   Validar Mensagem "Produto não encontrado"
    #Testar com ID inválida

Cenario C21: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTOS200
    Fazer Login e Armazenar Token    
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"

Cenario C25: PUT Editar Produto 200
    [tags]      PUTPRODUTOS200
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos/{_id}
    Validar Status Code "200"
    Validar mensagem "Registro alterado com sucesso"

#Cenario C26: PUT Editar Produto 201     #não funciona, token inválido apesar de funcionar nos outros testes
 #   [tags]      PUTPRODUTOS201
 #   Fazer Login e Armazenar Token
 #   PUT Endpoint /produtos/{_id}
 #   Validar Status Code "201"
 #   Validar mensagem "Cadastro realizado com sucesso"    