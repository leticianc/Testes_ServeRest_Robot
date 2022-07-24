* Settings *
Documentation       Keywords e variaveis para ações gerais
Library             OperatingSystem


* Keywords *
Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}

Validar Mensagem "${mensagem}"
    Should Be Equal     ${response.json()["message"]}    ${mensagem}

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}    ${quantidade}
    
Importar JSON Estatico
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File    ${EXECDIR}/${nome_arquivo}
    ${data}         Evaluate    json.loads('''${arquivo}''')    json
    [return]        ${data}