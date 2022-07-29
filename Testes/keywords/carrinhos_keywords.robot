* Settings *
Documentation   Keywords e variáveis para ações do endpoint /carrinhos
Resource        ../support/base.robot
Resource        ../keywords/login_keywords.robot

* Variables *
${id_carrinho}          2pGi2OuiHUJbeQH6
${token_invalido}       000000000000000000000

* Keywords *

GET Endpoint /carrinhos
    ${response}             GET On Session      serverest       /carrinhos
    Set Global Variable     ${response}

GET Endpoint /carrinhos/{_id}
    ${response}             GET On Session      serverest       /carrinhos/${id_carrinho}     expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             POST On Session     serverest   /carrinhos   json=&{payload}     headers=${header}  expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /carrinhos Sem Token
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["carrinho1"]} 
    Set Global Variable         ${payload}
    &{header}                   Create Dictionary   Authorization=${token_invalido}
    ${response}                 POST On Session     serverest   /carrinhos   json=&{payload}     headers=${header}  expected_status=anything
    Set Global Variable         ${response}

Criar Carrinho Estatico
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["carrinho1"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos
    
Criar Carrinho Estatico e Armazenar ID
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["carrinho1"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos
    ${id_carrinho}              Set Variable    ${response.json()["_id"]}
    Set Global Variable         ${id_carrinho}

POST Carrinho Produto Duplicado
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["produto_duplicado"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos

POST Carrinho Existente
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["carrinho_existente"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos

POST Carrinho Com Quantidade Insuficiente
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["quantidade_insuficiente"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos

POST Carrinho Invalido
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_carrinhos.json
    ${payload}                  Set Variable                ${json["produto_invalido"]} 
    Set Global Variable         ${payload}
    POST Endpoint /carrinhos

DELETE Endpoint /carrinhos/concluir-compra
    &{header}               Create Dictionary   Authorization=${token_auth}    
    ${response}             DELETE On Session   serverest   /carrinhos/concluir-compra  headers=${header}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/concluir-compra Sem Token
    &{header}               Create Dictionary   Authorization=${token_invalido}
    ${response}             DELETE On Session   serverest   /carrinhos/concluir-compra  headers=${header}   expected_status=anything
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}               Create Dictionary   Authorization=${token_auth}    
    ${response}             DELETE On Session   serverest   /carrinhos/cancelar-compra  headers=${header}   
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra Sem Token
    &{header}               Create Dictionary   Authorization=${token_invalido}
    ${response}             DELETE On Session   serverest   /carrinhos/cancelar-compra  headers=${header}   expected_status=anything
    Set Global Variable     ${response}
