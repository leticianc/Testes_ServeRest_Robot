* Settings *
Documentation   Keywords e variáveis para ações do endpoint /login
Resource        ../support/base.robot
Resource        ../keywords/usuarios_keywords.robot

* Keywords *
POST Endpoint /login
    &{payload}              Create Dictionary   email=${email}      password=senha123
    ${response}             POST On Session     serverest   /login   data=&{payload}
    Set Global Variable     ${response}

Fazer Login Com Usuario Dinamico
    POST Criar Usuario Dinamico
    POST Endpoint /login
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Set Global Variable     ${token_auth}

POST Fazer Login "${palavra}"
    ${payload}              Buscar Login        ${palavra}
    Set Global Variable     ${payload}
    ${response}             POST On Session     serverest   /login   json=${payload}    expected_status=anything
    Set Global Variable     ${response}

Definir Token Invalido
    ${token_auth}           Buscar Login        token_invalido
    Set Global Variable     ${token_auth}
    Log to Console          \n\nToken: ${token_auth}    

Fazer Login Usuario Não Administrador
    POST Usuario "user_nao_admin"
    Armazenar ID
    Log to console          \n\nDados Usuario: ${payload}
    ${email}                Set Variable    ${payload["email"]}
    Set Global Variable         ${email}
    POST Endpoint /login
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Set Global Variable     ${token_auth}