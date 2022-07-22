* Settings *
Documentation   Keywords e variáveis para ações do endpoint /usuarios
Resource        ../support/base.robot

* Variables *
${id_usuario}           y3SkN3yszirWqtlW

* Keywords *
Criar Um Usuario e Armazenar ID
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Log to Console          ID Usuario: ${id_usuario}
    Set Global Variable     ${id_usuario}

GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

GET Endpoint usuarios/{_id}
    ${response}             GET On Session      serverest       /usuarios/${id_usuario}
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest   /usuarios   json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}              Set Variable                ${json["nome_novo"]}
    ${response}             PUT On Session      serverest       /usuarios/${response.json()["_id"]}     json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest   /usuarios/${id_usuario}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}    ${quantidade}

Criar Usuario Estatico Valido
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_usuarios_ex.json
    ${payload}                  Set Variable                ${json["user_antigo"]}
    Set Global Variable         ${payload}
    POST Endpoint /usuarios
