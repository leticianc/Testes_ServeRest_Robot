* Settings *
Documentation   Keywords e variáveis para ações do endpoint /usuarios
Resource        ../support/base.robot


* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest   /usuarios   json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${response}             PUT On Session      serverest   /usuarios/${response.json()["_id"]}  json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest   /usuarios/${response.json()["_id"]}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}    ${quantidade}

Pegar Dados Usuario Estatico Valido
    ${json}                     Importar JSON Estatico      json_usuario_ex.json
    ${payload}                  Set Variable                ${json["user_valido"]}
    Set Global Variable         ${payload}
