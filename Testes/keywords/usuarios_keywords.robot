* Settings *
Documentation   Keywords e variáveis para ações do endpoint /usuarios
Resource        ../support/base.robot

* Variables *
${id_usuario}       F4kamm5X1wGPJhPu

* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

GET Endpoint usuarios/{_id}
    ${response}             GET On Session      serverest       /usuarios/${id_usuario}     expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest   /usuarios   json=&{payload}     expected_status=anything
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}              Set Variable                ${json["nome_novo"]}
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}    json=&{payload}
    Set Global Variable     ${response}
    Set Global Variable     ${id_usuario}

PUT Endpoint /usuarios Cadastro
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}              Set Variable                ${json["nome_novo"]}
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}    json=&{payload}
    ${id_usuario}           Set Variable                ${response.json()["_id"]}
    Set Global Variable     ${response}
    Set Global Variable     ${id_usuario}

PUT Endpoint /usuarios Invalido
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}              Set Variable                ${json["user_invalido"]}
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}    json=&{payload}  expected_status=anything
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest   /usuarios/${id_usuario}     expected_status=anything
    Set Global Variable     ${response}

Criar Usuario Dinamico e Armazenar ID
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}
    
Criar Usuario Dinamico e Armazenar ID e Email
    Criar Dados Usuario Valido
    ${email}                Set Variable    ${payload["email"]}
    Set Global Variable     ${email}
    POST Endpoint /usuarios
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}    

Criar Usuario Estatico e Armazenar ID
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}                  Set Variable                ${json["user_antigo"]} 
    Set Global Variable         ${payload}
    POST Endpoint /usuarios
    ${id_usuario}       Set Variable    ${response.json()["_id"]}
    Set Global Variable         ${id_usuario}

Criar Usuario Estatico Invalido
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}                  Set Variable                ${json["user_invalido"]} 
    Set Global Variable         ${payload}
    POST Endpoint /usuarios

Criar Usuario Não Administrador e Armazenar ID
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}                  Set Variable                ${json["user_nao_admin"]} 
    Set Global Variable         ${payload}
    POST Endpoint /usuarios
    ${id_usuario}       Set Variable    ${response.json()["_id"]}
    Set Global Variable         ${id_usuario}
    
Deletar Usuario Pela ID
    ${response}             DELETE On Session   serverest   /usuarios/${id_usuario}   
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}
    