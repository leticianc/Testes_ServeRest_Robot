* Settings *
Documentation       Keywords e variaveis para ações gerais
Library             OperatingSystem

* Keywords *
Importar JSON Estatico
    [Arguments]         ${nome_arquivo}
    ${arquivo}          Get File    ${EXECDIR}/${nome_arquivo}
    ${data}             Evaluate    json.loads('''${arquivo}''')    json
    [return]            ${data}

Mostrar Payload
    Log to console      \n\n${payload}

Mostrar Resposta
    Log to console      \n\nResponse: ${response.content}
    Log to Console      \n\nStatus Code: ${response.status_code}

Validar Mensagem "${mensagem}"
    Should Be Equal     ${response.json()["message"]}    ${mensagem}
    Log to console      \n\nMensagem esperada: ${mensagem} \nRetornada: ${response.json()["message"]}\n
    
Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}
    Log to console      \nStatus Code Esperado: ${statuscode} \nRetornado: ${response.status_code}\n
    
Mostrar Response
    Log to console      \n\nResponse: ${response.content}

Mostrar Usuario
    Log to console          \n\nDados Usuario: ${payload}\n\nID Usuario: ${id_usuario}

Mostrar Produto
    Log to console          \n\nDados Produto: ${payload}\n\nID Produto: ${id_produto}

Mostrar Carrinho
    Log to console          \n\nDados Carrinho: ${payload}\n\nID Carrinho: ${id_carrinho}

Deletar Dados da Base
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos 
    DELETE Endpoint /usuarios

Comparar Mensagem "${mensagem}"
    Log to console      \nMENSAGEM DIFERENTE DO PREVISTO NA DOCUMENTAÇÃO\n\nMensagem esperada: ${mensagem} \nRetornada: ${response.json()["message"]}\n

Comparar Status Code "${statuscode}"
    Log to console      \nSTATUS CODE DIFERENTE DO PREVISTO NA DOCUMENTAÇÃO\n\nStatus Code Esperado: ${statuscode} \nRetornado: ${response.status_code}\n

Mostrar Mensagem Não Documentada
    Log to console      \nPOSSIBILIDADE NÃO DOCUMENTADA\n