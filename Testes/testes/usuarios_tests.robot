* Settings *
Documentation       Arquivo de testes para endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C7: GET Listar Usuarios 200
    [tags]      C7
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario C8: GET Buscar Usuario Por ID 200
    [tags]      C8
    POST Criar Usuario Dinamico
    GET Endpoint usuarios/{_id}
    Mostrar Response
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenario C9: GET Buscar Usuario Com ID Invalida 400
    [tags]      C9
    Definir ID Usuario Inválida
    GET Endpoint usuarios/{_id}
    Validar Mensagem "Usuário não encontrado"
    Validar Status Code "400"

Cenario C10: POST Cadastrar Usuario 201
    [tags]      C10
    POST Criar Usuario Dinamico
    Mostrar Usuario
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Status Code "201"  
    DELETE Endpoint /usuarios

Cenario C11: POST Cadastrar Usuario Sem Nome
    [tags]      C11
    POST Usuario "Sem_Nome"
    Mostrar payload
    Mostrar Resposta

Cenario C12: POST Cadastrar Usuario Sem Email
    [tags]      C12
    POST Usuario "Sem_Email"
    Mostrar payload
    Mostrar Resposta

Cenario C13: POST Cadastrar Usuario Sem Senha
    [tags]      C13
    POST Usuario "Sem_Senha"
    Mostrar payload
    Mostrar Resposta

Cenario C14: POST Cadastrar Usuario Sem Administrador
    [tags]      C14
    POST Usuario "Sem_Administrador"
    Mostrar payload
    Mostrar Resposta

Cenario C15: POST Cadastrar Usuario Email Cadastrado 400
    [tags]      C15
    POST Usuario "Email_Cadastrado"
    Mostrar payload
    Validar Mensagem "Este email já está sendo usado"
    Validar Status Code "400"

Cenario C16: PUT Editar Usuario 200
    [tags]      C16
    POST Criar Usuario Dinamico
    Mostrar Usuario
    PUT Endpoint /usuarios
    Mostrar Usuario
    Validar Mensagem "Registro alterado com sucesso"
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenario C17: PUT Editar Novo Usuario 201
    [tags]      C17
    Definir ID Usuario Inválida
    PUT Endpoint /usuarios
    Armazenar ID
    Mostrar Usuario
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Status Code "201"
    DELETE Endpoint /usuarios

Cenario C18: PUT Editar Novo Usuario Com Email Cadastrado 400
    [tags]      C18
    Definir ID Usuario Inválida
    PUT Usuario Email Cadastrado
    Mostrar Payload
    Validar Mensagem "Este email já está sendo usado"
    Validar Status Code "400"

Cenario C19: DELETE Excluir Usuario 200
    [tags]      C19
    POST Criar Usuario Dinamico
    DELETE Endpoint /usuarios
    Validar Mensagem "Registro excluído com sucesso"
    Validar Status Code "200"
    Verificar Se Usuario Foi Deletado

Cenario C20: DELETE Excluir Usuario Com Carrinho 400
    [tags]      C20
    Criar Carrinho Dinamico
    DELETE Endpoint /usuarios
    Validar Mensagem "Não é permitido excluir usuário com carrinho cadastrado"
    Validar Status Code "400"
    Deletar Dados da Base