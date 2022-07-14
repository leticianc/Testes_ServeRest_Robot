#Sessão para confirguração, documentação, imports de arquivos e libraries
* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary


#Sessão para setagem de variáveis para utilização
* Variables *
${nome_do_usuario}      herbert richards
${senha_do_usuario}     teste123
${email_do_usuario}     testedoteste@email.com



#Sessão para criação dos cenários de teste
* Test Cases *
Cenario: GET Todos os Usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${5}"
    Printar Conteudo Response

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


#Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest   http://localhost:3000/

GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

POST Endpoint /usuarios
    &{payload}              Create Dictionary   nome=${nome_do_usuario}    email=${email_do_usuario}    password=${senha_do_usuario}    administrador=true
    ${response}             POST On Session     serverest   /usuarios   data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}              Create Dictionary   nome=nome novo    email=fulana@email.com     password=123    administrador=true
    ${response}             PUT On Session      serverest   /usuarios/4gUPBrg8xy1aYbNK  data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session     serverest     /usuarios/4gUPBrg8xy1aYbNK
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}    ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain      ${response.json()["message"]}   ${palavra}

Printar Conteudo Response
    Log To console      Response: ${response.json()["usuarios"][1]["nome"]}