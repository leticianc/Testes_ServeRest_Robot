* Settings *
Documentation   Keywords e variáveis para ações do endpoint /produtos
Resource        ../support/base.robot
Resource        ../keywords/login_keywords.robot

* Variables *
${id_produto}           1cf0KLZ4Ye9GomRo
${token_invalido}       000000000000000000000

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
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /produtos Sem Token
    &{header}               Create Dictionary   Authorization=${token_invalido}
    &{payload}              Create Dictionary   nome=produto   preco=100   descricao=descricao     quantidade=10
    ${response}             POST On Session     serverest   /produtos   json=&{payload}     headers=${header}   expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Produto Existente
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto_existente"]} 
    Set Global Variable         ${payload}
    POST Endpoint /produtos

PUT Endpoint /produtos
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_produtos_ex.json
    ${payload}              Set Variable                ${json["produto2"]}
    ${response}             PUT On Session      serverest       /produtos/${id_produto}    json=&{payload}  headers=${header}   expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}
    Set Global Variable     ${id_produto}

PUT Endpoint /produtos Cadastro
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_produtos_ex.json
    ${payload}              Set Variable                ${json["produto2"]}
    ${response}             PUT On Session      serverest       /produtos/${id_produto}    json=&{payload}  headers=${header}
    ${id_produto}           Set Variable                ${response.json()["_id"]}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}
    Set Global Variable     ${id_produto}

PUT Endpoint /usuarios Invalido
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_produtos_ex.json
    ${payload}              Set Variable                ${json["produto_existente"]}
    ${response}             PUT On Session      serverest       /produtos/${id_produto}    json=&{payload}  headers=${header}   expected_status=anything 
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /produtos Sem Token
    &{header}               Create Dictionary   Authorization=${token_invalido}
    &{payload}              Create Dictionary   nome=produto   preco=100   descricao=descricao     quantidade=10
    ${response}             PUT On Session      serverest   /produtos/${id_produto}     json=&{payload}     headers=${header}   expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /produtos
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             DELETE On Session     serverest   /produtos/${id_produto}    headers=${header}      expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /produtos Sem Token
    &{header}               Create Dictionary   Authorization=${token_invalido}
    ${response}             DELETE On Session     serverest   /produtos/${id_produto}    headers=${header}      expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Criar Produto Estatico
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto1"]} 
    Set Global Variable         ${payload}
    POST Endpoint /produtos

Criar Produto Estatico e Armazenar ID
    ${json}                     Importar JSON Estatico      ./support/fixtures/static/json_produtos_ex.json
    ${payload}                  Set Variable                ${json["produto1"]} 
    Set Global Variable         ${payload}
    POST Endpoint /produtos
    ${id_produto}               Set Variable                ${response.json()["_id"]}
    Set Global Variable         ${id_produto}

Deletar Pela ID
    &{header}               Create Dictionary   Authorization=${token_auth}    
    ${response}             DELETE On Session   serverest   /produtos/${id_produto}     headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}