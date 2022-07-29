* Settings *
Documentation       Keywords e variaveis para ações gerais
Library             OperatingSystem

* Keywords *
Importar JSON Estatico
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File    ${EXECDIR}/${nome_arquivo}
    ${data}         Evaluate    json.loads('''${arquivo}''')    json
    [return]        ${data}

Mostrar Resposta
    Log to console          \n\nResponse: ${response.content}
    Log to Console          \n\nStatus Code: ${response.status_code}

Mostrar payload
    Log to console          \n\n${payload}

Mostrar Usuario
    Log to console          \n\nDados: ${payload}\n\nID: ${id_usuario}

Mostrar Produto
    Log to console          \n\nDados: ${payload}\n\nID: ${id_produto}

Validar Mensagem "${mensagem}"
    Should Be Equal     ${response.json()["message"]}    ${mensagem}
    Log to console      \n\nMensagem esperada: ${mensagem} \nRetornada: ${response.json()["message"]}\n
    
Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}
    Log to console      \nStatus Code Esperado: ${statuscode} \nRetornado: ${response.status_code}\n
    