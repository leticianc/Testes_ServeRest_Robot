* Settings *
Documentation       Keywords e variaveis para ações gerais
Library             OperatingSystem


* Keywords *
Validar Mensagem "${mensagem}"
    Should Be Equal     ${response.json()["message"]}    ${mensagem}
    Log to console      \n\nMensagem esperada: ${mensagem} \nMensagem obtida: ${response.json()["message"]}\n   
    
Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}
    Log to console      Status Code esperado: ${statuscode} \nStatus Code obtido: ${response.status_code}\n    

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}    ${quantidade}
    
Importar JSON Estatico
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File    ${EXECDIR}/${nome_arquivo}
    ${data}         Evaluate    json.loads('''${arquivo}''')    json
    [return]        ${data}

Printar Resposta
    Log to console          Response: ${response.content}
