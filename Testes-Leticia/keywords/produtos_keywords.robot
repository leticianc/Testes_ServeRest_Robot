* Settings *
Documentation   Keywords e variáveis para ações do endpoint /produtos
Resource        ../support/base.robot
Resource        ../keywords/usuarios_keywords.robot

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Set Global Variable     ${response}

GET Endpoint produtos/{_id}
    ${response}             GET On Session      serverest       /produtos/${id_produto}     expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /produtos 
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             POST On Session     serverest   /produtos   json=&{payload}     headers=${header}   expected_status=anything
    Set Global Variable     ${response}

DELETE Endpoint /produtos 
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             DELETE On Session     serverest   /produtos/${id_produto}      headers=${header}
    Set Global Variable     ${response}

Criar Produto Dinamico
    Criar Dados Produto Valido
    POST Endpoint /produtos
    ${id_produto}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_produto}

POST Produto "${palavra}"
    ${payload}              Buscar Produto      ${palavra}
    Set Global Variable         ${payload}
    POST Endpoint /produtos 