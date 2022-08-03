* Settings *
Documentation   Keywords e variáveis para ações do endpoint /usuarios
Resource        ../support/base.robot
Resource        ../keywords/login_keywords.robot
Resource        ../keywords/carrinhos_keywords.robot

* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}
    Mostrar Response

GET Endpoint usuarios/{_id}
    ${response}             GET On Session      serverest       /usuarios/${id_usuario}     expected_status=anything
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest       /usuarios   json=&{payload}     expected_status=anything
    Set Global Variable     ${response}

POST Criar Usuario Dinamico
    Criar Dados Usuario Valido
    ${email}                Set Variable        ${payload["email"]}
    Set Global Variable     ${email}
    POST Endpoint /usuarios
    Armazenar ID

PUT Endpoint /usuarios
    Criar Dados Usuario Valido
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}    json=&{payload}
    Set Global Variable     ${response}

PUT Usuario Email Cadastrado
    ${payload}              Buscar Usuario      Email_Cadastrado
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}    json=&{payload}  expected_status=anything
    Set Global Variable     ${payload}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest       /usuarios/${id_usuario}     expected_status=anything
    Set Global Variable     ${response}

Armazenar ID
    ${id_usuario}           Set Variable        ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}

Definir ID Usuario Inválida
    ${id_usuario}           Buscar Usuario      id_invalida
    Set Global Variable     ${id_usuario}
    Log to Console          \n\nID Usuario: ${id_usuario}

POST Usuario "${palavra}"
    ${payload}              Buscar Usuario      ${palavra}
    Set Global Variable     ${payload}
    POST Endpoint /usuarios

Verificar Se Usuario Foi Deletado
    GET Endpoint usuarios/{_id}
    Should Be Equal         ${response.json()["message"]}   Usuário não encontrado
    Log to Console          Buscando ID do usuário na base: ${response.json()["message"]}\n

    