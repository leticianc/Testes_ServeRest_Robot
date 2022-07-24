* Settings *
Documentation   Keywords e variáveis para ações do endpoint /carrinhos
Resource        ../support/base.robot
Resource        ../keywords/login_keywords.robot

* Variables *
${id_carrinho}          
* Keywords *

GET Endpoint /carrinhos
    ${response}             GET On Session      serverest       /carrinhos
    Set Global Variable     ${response}

GET Endpoint /carrinhos/{_id}
    ${response}             GET On Session      serverest       /carrinhos/${id_carrinho}     expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             POST On Session     serverest   /carrinhos   json=&{payload}     headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Criar Carrinho Estatico
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["carrinho_novo"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos

Criar Carrinho Estatico e Armazenar ID
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["carrinho_novo"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos
    ${id_carrinho}              Set Variable    ${response.json()["_id"]}
    Set Global Variable         ${id_carrinho}

DELETE Endpoint /carrinhos/concluir-compra
    &{header}               Create Dictionary   Authorization=${token_auth}    
    ${response}             DELETE On Session   serverest   /carrinhos/concluir-compra  headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}               Create Dictionary   Authorization=${token_auth}    
    ${response}             DELETE On Session   serverest   /carrinhos/cancelar-compra  headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

    #expected_status=anything

