* Settings *
Documentation   Keywords e variáveis para ações do endpoint /produtos
Resource        ../support/base.robot
Resource        ../keywords/usuarios_keywords.robot

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Set Global Variable     ${response}
    Mostrar Response

GET Endpoint produtos/{_id}
    ${response}             GET On Session      serverest       /produtos/${id_produto}     expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /produtos 
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             POST On Session     serverest   /produtos   json=&{payload}     headers=${header}   expected_status=anything
    Set Global Variable     ${response}

PUT Endpoint /produtos
    &{header}               Create Dictionary   Authorization=${token_auth}
    Criar Dados Produto Valido
    ${response}             PUT On Session      serverest       /produtos/${id_produto}    json=&{payload}  headers=${header}   expected_status=anything
    Set Global Variable     ${response}    

PUT Endpoint /produtos Existente
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${payload}              Buscar Produto      Com_Nome_Existente
    ${response}             PUT On Session      serverest       /produtos/${id_produto}    json=&{payload}  headers=${header}   expected_status=anything 
    Set Global Variable     ${payload}
    Set Global Variable     ${response}

DELETE Endpoint /produtos 
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             DELETE On Session     serverest   /produtos/${id_produto}      headers=${header}    expected_status=anything 
    Set Global Variable     ${response}

Definir Quantidade Atual
    ${quant_atual}           Set Variable       ${response.json()["quantidade"]}
    Set Global Variable     ${quant_atual}

Criar Produto Dinamico
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Armazenar ID Produto

Definir ID Produto Inválida
    ${id_produto}           Buscar Produto      id_invalida
    Set Global Variable     ${id_produto}
    Log to Console          \n\nID Produto: ${id_produto}

POST Produto "${palavra}"
    ${payload}              Buscar Produto      ${palavra}
    Set Global Variable         ${payload}
    POST Endpoint /produtos 

Armazenar ID Produto
    ${id_produto}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_produto}

Definir ID Produto Valida
    ${id_produto}           Set Variable    BeeJh5lz3k6kSIzA
    Set Global Variable     ${id_produto}

Verificar Se Produto Foi Deletado
    GET Endpoint produtos/{_id}
    Should Be Equal         ${response.json()["message"]}   Produto não encontrado
    Log to Console          Buscando ID do produto na base: ${response.json()["message"]}\n