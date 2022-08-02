* Settings *
Documentation   Keywords e variáveis para ações do endpoint /carrinhos
Resource        ../support/base.robot
Resource        ../keywords/produtos_keywords.robot

* Keywords *
GET Endpoint /carrinhos
    ${response}             GET On Session      serverest       /carrinhos
    Set Global Variable     ${response}
    Mostrar Response

GET Endpoint carrinhos/{_id}
    ${response}             GET On Session      serverest       /carrinhos/${id_carrinho}     expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             POST On Session     serverest   /carrinhos   json=&{payload}     headers=${header}   expected_status=anything
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/concluir-compra
    &{header}               Create Dictionary   Authorization=${token_auth}    
    ${response}             DELETE On Session   serverest   /carrinhos/concluir-compra  headers=${header}       expected_status=anything
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}               Create Dictionary   Authorization=${token_auth}    
    ${response}             DELETE On Session   serverest   /carrinhos/cancelar-compra  headers=${header}       expected_status=anything
    Set Global Variable     ${response}

Criar Carrinho Dinamico
    Fazer Login Com Usuario Dinamico
    Criar Produto Dinamico
    Criar Dados Carrinho Valido
    POST Endpoint /carrinhos
    ${id_carrinho}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_carrinho}

Definir ID Carrinho Inválida
    ${id_carrinho}          Buscar Carrinho     id_invalida
    Set Global Variable     ${id_carrinho}
    Log to Console          \n\nID Carrinho: ${id_carrinho}

Definir ID Carrinho Valida
    ${id_carrinho}          Buscar Carrinho     id_valida
    Set Global Variable     ${id_carrinho}

POST Carrinho Duplicado
    ${payload}              Buscar Carrinho     Produto_Duplicado
    Set GLobal Variable     ${payload}
    POST Endpoint /carrinhos

POST Carrinho Quantidade Insuficiente
    ${payload}              Buscar Carrinho     Quantidade_Insuficiente
    Set GLobal Variable     ${payload}
    POST Endpoint /carrinhos    

POST Carrinho Com Produto Invalido
    ${payload}              Buscar Carrinho     Produto_Invalido
    Set GLobal Variable     ${payload}
    POST Endpoint /carrinhos    

Verificar Se Carrinho Foi Deletado
    GET Endpoint carrinhos/{_id}
    Should Be Equal         ${response.json()["message"]}   Carrinho não encontrado
    Log to Console          Buscando ID ${id_carrinho} na base: ${response.json()["message"]}\n

Verificar Se Quantidade Foi Alterada
    GET Endpoint produtos/{_id}
    Definir Quantidade Atual
    ${valor}                Subtrair    ${quant_original}   ${quant_carrinho}
    Should Be Equal         ${valor}    ${quant_atual} 
    Log to Console          Quantidade Original do Produto: ${quant_original}, Quantidade Atual: ${quant_atual}\n

Verificar Se Quantidade Foi Reestabelecida
    GET Endpoint produtos/{_id}
    Definir Quantidade Atual
    ${valor}                Subtrair    ${quant_original}   ${quant_carrinho}
    Should Be Equal         ${quant_original}   ${quant_atual} 
    Log to Console          Quantidade Original do Produto: ${quant_original}, Quantidade Atual: ${quant_atual}\n