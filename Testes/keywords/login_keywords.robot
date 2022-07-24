* Settings *
Documentation   Keywords e variáveis para ações do endpoint /login
Resource        ../support/base.robot

* Keywords *
POST Endpoint /login User Valido
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_login_ex.json
    ${payload}              Set Variable                ${json["login_valido"]}
    ${response}             POST On Session     serverest   /login   json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /login User Nao Administrador
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_login_ex.json
    ${payload}              Set Variable                ${json["user_nao_admin"]}
    ${response}             POST On Session     serverest   /login   json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /login Email Invalido
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_login_ex.json
    ${payload}              Set Variable                ${json["email_invalido"]}
    ${response}             POST On Session     serverest   /login   json=&{payload}    expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /login Senha Invalida
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_login_ex.json
    ${payload}              Set Variable                ${json["senha_invalida"]}
    ${response}             POST On Session     serverest   /login   json=&{payload}    expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /login Sem Senha
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_login_ex.json
    ${payload}              Set Variable                ${json["sem_senha"]}
    ${response}             POST On Session     serverest   /login   json=&{payload}    expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /login Sem Email
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/json_login_ex.json
    ${payload}              Set Variable                ${json["sem_email"]}
    ${response}             POST On Session     serverest   /login   json=&{payload}    expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Fazer Login e Armazenar Token
    POST Endpoint /login User Valido
    ${token_auth}           Set Variable    ${response.json()["authorization"]}
    Log To Console          Token Salvo: ${token_auth}
    Set Global Variable     ${token_auth}

Fazer Login Não Administrador e Armazenar Token
    POST Endpoint /login User Nao Administrador
    ${token_auth}           Set Variable    ${response.json()["authorization"]}
    Log To Console          Token Salvo: ${token_auth}
    Set Global Variable     ${token_auth}
