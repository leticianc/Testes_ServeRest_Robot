* Settings *
Documentation   Keywords e variáveis para ações do endpoint /carrinhos
Resource            ./produtos.robot
 
* Variables *
@{idProduto}    Create List     BeeJh5lz3k6kSIzA       K6leHdftCeOJj8BJ
@{quantidade}   Create List     2                       3

* Keywords *

GET Endpoint /carrinhos
    ${response}             GET On Session      serverest       /carrinhos
    Set Global Variable     ${response}


POST Endpoint /carrinhos
    &{header}               Create Dictionary   Authorization=${token_auth}
    &{produtos}             Create Dictionary   idProduto=@{idProduto}    quantidade=@{quantidade}
    &{payload}              Create Dictionary   produto=@{produtos}
    ${response}             POST On Session     serverest   /produtos   data=&{payload}     headers=${header}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}