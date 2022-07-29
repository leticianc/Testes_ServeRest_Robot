* Settings *
Documentation   Keywords e variáveis para ações do endpoint /usuarios
Resource        ../support/base.robot
Resource        ../keywords/login_keywords.robot

* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}
    Log to console          \n\nResponse: ${response.content}

GET Endpoint usuarios/{_id}
    ${response}             GET On Session      serverest       /usuarios/${id_usuario}     expected_status=anything
    Set Global Variable     ${response}
    Log to console          \n\nResponse: ${response.content}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest   /usuarios   json=&{payload}     expected_status=anything
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    Criar Dados Usuario Valido
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}    json=&{payload}
    Set Global Variable     ${response}    

PUT Endpoint /usuarios Cadastro
    Criar Dados Usuario Valido
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}    json=&{payload} 
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${response}
    Set Global Variable     ${id_usuario}    

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest   /usuarios/${id_usuario}
    Set Global Variable     ${response}

Criar Usuario Dinamico e Armazenar Dados
    Criar Dados Usuario Valido
    ${email}                Set Variable    ${payload["email"]}
    Set Global Variable     ${email}
    POST Endpoint /usuarios
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}

Verificar Se Usuario Foi Deletado
    GET Endpoint usuarios/{_id}
    Should Be Equal         ${response.json()["message"]}   Usuário não encontrado
    Log to Console          Buscando usuário na base: ${response.json()["message"]}\n

POST Usuario "${palavra}"
    ${payload}              Buscar Usuario      ${palavra}
    Set Global Variable     ${payload}
    POST Endpoint /usuarios 

Criar Usuario Não Administrador e Armazenar Dados
    ${json}                 Importar JSON Estatico      ./support/fixtures/static/usuarios.json
    ${payload}              Set Variable                ${json["user_nao_admin"]} 
    Set Global Variable     ${payload}
    POST Endpoint /usuarios
    ${email}                Set Variable    ${payload["email"]}
    ${id_usuario}           Set Variable    ${response.json()["_id"]}
    Set Global Variable     ${email}
    Set Global Variable     ${id_usuario}