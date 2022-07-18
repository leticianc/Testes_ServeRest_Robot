#Sessão para confirguração, documentação, imports de arquivos e libraries
* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Resource            ./usuarios_keywords.robot
Resource            ./login_keywords.robot
Resource            ./produtos_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
Cenario: GET Todos os Usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${3}"
    #Printar Conteudo Response

Cenario: POST Cadastrar Usuario 201
    [tags]      POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT Editar Usuario 200
    [tags]      PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"    

Cenario: DELETE Deletar usuario 200
    [tags]      DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200" 

Cenario: POST Realizar Login 200
    [tags]      POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST Criar Produto 201
    [tags]      POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: POST Criar Usuario De Massa Estatica 201
    [tags]      POSTCRIARUSUARIOESTATICO
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

#Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest   http://localhost:3000/
