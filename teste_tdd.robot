* Test Cases *
Cenário: GET Todos os Usuarios 200
    Get Endpoint /usuarios
    Validar Todos os Usuarios na Response
    Validar Status Code "200"

Cenário: GET Usuario 200
    GET Endpoint /usuarios com ID "GGTtwearsdw223"
    Validar o usuario com id "GGTtwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Nome = Fulano da Silva"

Cenário: POST Criar Novo Usuario 201
    Criar Usuário Dinâmico
    POST Usuário Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Editar Usuario Existente 200
    PUT Editar Usuário com id "/GGTtwearsd" usando Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenário: DELETE Usuario Existente 200
    DELETE Usuário Específico com id "/GGTtwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso | Nenhum registro excluído"

