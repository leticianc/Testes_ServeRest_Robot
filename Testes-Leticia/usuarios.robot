* Settings *
Documentation   Keywords e variáveis para ações do endpoint /usuarios

* Variables *
${nome_do_usuario}      Fulano da Silva
${senha_do_usuario}     teste
${email_do_usuario}     fulano@qa.com
${id_usuario}           6q4wIHJKMCss9dkd

* Keywords *

Printar Conteudo Response
    Log To console      Response: ${response.json()["usuarios"]}

GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

POST Endpoint /usuarios
    &{payload}              Create Dictionary   nome=${nome_do_usuario}    email=${email_do_usuario}    password=${senha_do_usuario}    administrador=true
    ${response}             POST On Session     serverest   /usuarios   data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}              Create Dictionary   nome=${nome_do_usuario}     email=${email_do_usuario}   password=123    administrador=true
    ${response}             PUT On Session      serverest   /usuarios/${id_usuario}  data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest     /usuarios/${id_usuario}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint usuarios/{_id}     #nova
    ${response}             GET On Session      serverest       /usuarios/${id_usuario}
    Set Global Variable     ${response}
    