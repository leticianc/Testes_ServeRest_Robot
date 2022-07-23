* Settings *
Documentation       Arquivo de testes para endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *

Cenario C6: GET Listar Usuarios 200
    [tags]      GETUSUARIOS200
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${1}"

Cenario C7: GET Buscar Usuario Por ID 200
    [tags]      GETUSUARIOSID200
    Criar Usuario Dinamico e Armazenar ID
    GET Endpoint usuarios/{_id}
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenario C8: GET Buscar Usuario Por ID 400
    [tags]      GETUSUARIOSID400
    GET Endpoint usuarios/{_id}
    Validar Status Code "400"
    Validar Mensagem "Usuário não encontrado"

Cenario C9: POST Cadastrar Usuario 201
    [tags]      POSTUSUARIOS201
    Criar Usuario Dinamico e Armazenar ID
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    DELETE Endpoint /usuarios

Cenario C10: POST Cadastrar Usuario 400
    [tags]      POSTUSUARIOS400
    Criar Usuario Estatico Invalido
    Validar Status Code "400"
    Validar Mensagem "Este email já está sendo usado"

Cenario C11: PUT Editar Usuario 200
    [tags]      PUTUSUARIOS200
    Criar Usuario Estatico e Armazenar ID
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso" 
    DELETE Endpoint /usuarios   

Cenario C12: PUT Editar Usuario 201
    [tags]      PUTUSUARIOS201
    PUT Endpoint /usuarios Cadastro
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso" 
    DELETE Endpoint /usuarios   

Cenario C13: PUT Editar Usuario 400
    [tags]      PUTUSUARIOS400
    PUT Endpoint /usuarios Invalido
    Validar Status Code "400"
    Validar Mensagem "Este email já está sendo usado" 
    DELETE Endpoint /usuarios   

Cenario C14: DELETE Excluir Usuario 200
    [tags]      DELETEUSUARIOS200
    Criar Usuario Dinamico e Armazenar ID
    DELETE Endpoint /usuarios
    Validar Status Code "200" 
    Validar Mensagem "Registro excluído com sucesso"
    # buscar usuário pela ID, achar uma keyword para "não deve ser encontrado" ou algo assim

#Cenario C15: DELETE Excluir Usuario 400
#    [tags]      DELETEUSUARIOS400
#    Criar Usuario Dinamico e Armazenar ID
#    Criar Carrinho Para Usuario
#    DELETE Endpoint /usuarios
#    Validar Status Code "400" 
#    Validar Mensagem "Não é permitido excluir usuário com carrinho cadastrado"
#    DELETE Endpoint /carrinhos
#    DELETE Endpoint /usuarios

Deletando Pela ID
    [tags]      DELETE
    Deletar Pela ID

