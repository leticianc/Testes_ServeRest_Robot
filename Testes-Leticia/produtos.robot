* Settings *
Documentation   Keywords e variáveis para ações do endpoint /produtos
 
* Variables *
${nome_produto}             Logitech MX Vertical
${preco}                    470
${descricao}                Mouse
${quantidade}               2
${id_produto}               BeeJh5lz3k6kSIzA

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Set Global Variable     ${response}

POST Endpoint /produtos
    &{header}               Create Dictionary   Authorization=${token_auth}
    &{payload}              Create Dictionary   nome=${nome_produto}    preco=${preco}  descricao=${descricao}  quantidade=${quantidade}
    ${response}             POST On Session     serverest   /produtos   data=&{payload}     headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /produtos/{_id}
    ${response}             GET On Session      serverest       /produtos/${id_produto}
    Set Global Variable     ${response}

DELETE Endpoint /produtos/{_id}
    &{header}               Create Dictionary   Authorization=${token_auth}
    ${response}             DELETE On Session     serverest   /produtos/${id_produto}    headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /produtos/{_id}
    &{header}               Create Dictionary   Authorization=${token_auth}
    &{payload}              Create Dictionary   nome=${nome_produto}    preco=${preco}  descricao=${descricao}  quantidade=${quantidade}
    ${response}             PUT On Session      serverest   /produtos/${id_produto}  data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}