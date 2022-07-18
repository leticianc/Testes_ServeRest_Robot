* Settings *
Documentation   Keywords e variáveis para ações gerais
Library         OperatingSystem

* Keywords *
Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}

Importar JSON Estatico
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File        ${EXECDIR}/${nome_arquivo}
    ${data}         Evaluate        json.loads('''${arquivo}''')    json
    [return]        ${data}