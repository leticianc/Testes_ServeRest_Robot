* Settings *
Documentation   Keywords e variáveis para ações do endpoint /login
Resource        ../support/base.robot
Resource        ../keywords/usuarios_keywords.robot

* Keywords *
POST Endpoint /login
    &{payload}              Create Dictionary   email=${email}      password=senha123
    ${response}             POST On Session     serverest   /login   data=&{payload}
    ${token_auth}           Set Variable    ${response.json()["authorization"]}
    Set Global Variable     ${response}
    Set Global Variable     ${token_auth}    

POST Fazer Login "${palavra}"
    ${payload}              Buscar Login        ${palavra}
    Set Global Variable     ${payload}
    ${response}             POST On Session     serverest   /login   json=${payload}    expected_status=anything
    Set Global Variable     ${response}
      