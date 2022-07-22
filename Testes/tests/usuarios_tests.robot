* Settings *
Documentation       Arquivo de testes para endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *

Cenario C6: GET Listar Usuarios 200
    [tags]      GETUSUARIOS200
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario C7: GET Buscar Usuario Por ID 200
    [tags]      GETUSUARIOSID200
    Criar Um Usuario e Armazenar ID
    GET Endpoint usuarios/{_id}
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenario C8: POST Cadastrar Usuario 201
    [tags]      POSTUSUARIOS201
    Criar Um Usuario e Armazenar ID
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    DELETE Endpoint /usuarios

#Cenario C8: GET Buscar Usuario Por ID 400   #não funciona
 #   [tags]      GETUSUARIOSID400
  #  Criar Sessao
   # GET Endpoint usuarios/{_id}
    #Validar Status Code "400"
     #Validar Mensagem "Usuário não encontrado"
      #testar com uma ID inválida

Cenario C9: DELETE Excluir Usuario 200
    [tags]      DELETEUSUARIOS200
    Criar Um Usuario e Armazenar ID
    DELETE Endpoint /usuarios
    Validar Status Code "200" 
    Validar Mensagem "Registro excluído com sucesso"
    # buscar usuário pela ID, achar uma keyword para "não deve ser encontrado" ou algo assim

Cenario C11: PUT Editar Usuario 200
    [tags]      PUTUSUARIOS200
    Criar Usuario Estatico Valido
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"    

Cenario: POST Criar Usuario De Massa Estatica 201
    [tags]      POSTCRIARUSUARIOESTATICO
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
