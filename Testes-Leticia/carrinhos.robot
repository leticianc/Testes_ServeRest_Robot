* Settings *
Documentation   Keywords e variáveis para ações do endpoint /carrinhos
Resource            ./produtos.robot
 
* Variables *

* Keywords *

GET Endpoint /carrinhos
    ${response}             GET On Session      serverest       /carrinhos
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    &{header}               Create Dictionary   Authorization=${token_auth}
    &{produtos}             Create Dictionary   ${idProduto}    BeeJh5lz3k6kSIzA    K6leHdftCeOJj8BJ    ${quantidade}    2   1
    &{payload}              Create Dictionary   produtos=&{produtos}
    ${response}             POST On Session     serverest   /carrinhos   data=&{payload}     headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}