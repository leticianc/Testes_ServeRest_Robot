* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Resource            ./login.robot
Resource            ./usuarios.robot
Resource            ./produtos.robot
Resource            ./carrinhos.robot


* Variables *


* Keywords *
Criar Sessao
    Create Session          serverest   http://localhost:3000/

Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}

Validar Mensagem "${mensagem}"
    Should Be Equal     ${response.json()["message"]}    ${mensagem}



* Test Cases *

Cenario C1: Realizar Login 200
    [tags]      GETLOGIN200
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"
    Validar Mensagem "Login realizado com sucesso"

Cenario C2: Realizar Login 400  #não funciona, status code 401
    [tags]      GETLOGIN400
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "400"
    Validar Mensagem "E-mail e/ou senha inválidos"
    #testar com dados inválidos

Cenario C4: GET Listar Usuarios 200
    [tags]      GETUSUARIOS200
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Printar Conteudo Response

Cenario C5: POST Cadastrar Usuario 201
    [tags]      POSTUSUARIOS201
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenario C7: GET Buscar Usuario Por ID 200
    [tags]      GETUSUARIOSID200
    Criar Sessao
    GET Endpoint usuarios/{_id}
    Validar Status Code "200"

Cenario C8: GET Buscar Usuario Por ID 400   #não funciona
    [tags]      GETUSUARIOSID400
    Criar Sessao
    GET Endpoint usuarios/{_id}
    Validar Status Code "400"
    Validar Mensagem "Usuário não encontrado"
    #testar com uma ID inválida

Cenario C9: DELETE Excluir Usuario 200
    [tags]      DELETEUSUARIOS200
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200" 
    Validar Mensagem "Registro excluído com sucesso"
    # buscar usuário pela ID, achar uma keyword para "não deve ser encontrado" ou algo assim

Cenario C11: PUT Editar Usuario 200
    [tags]      PUTUSUARIOS200
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"    

Cenario C14: GET Listar Produtos 200
    [tags]      GETPRODUTOS200
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario C15: POST Cadastrar Produto 201
    [tags]      POSTPRODUTOS201
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenario C16: POST Cadastrar Produto 400     #não funciona
    [tags]      POSTPRODUTOS400
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem "Já existe produto com esse nome"
    #Informar um nome de produto já cadastrado

Cenario C17: POST Cadastrar Produto 401     #não funciona
    [tags]      POSTPRODUTOS401
    Criar Sessao
    POST Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario C19: GET Buscar Produto Por ID 200
    [tags]      GETPRODUTOSID200
    Criar Sessao
    GET Endpoint /produtos/{_id}
    Validar Status Code "200"

Cenario C20: GET Buscar Produto Por ID 400      #não funciona
    [tags]      GETPRODUTOSID400
    Criar Sessao
    GET Endpoint /produtos/{_id}
    Validar Status Code "400"
    Validar Mensagem "Produto não encontrado"
    #Testar com ID inválida

Cenario C21: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTOS200
    Criar Sessao
    Fazer Login e Armazenar Token    
    DELETE Endpoint /produtos/{_id}
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"

Cenario C25: PUT Editar Produto 200
    [tags]      PUTPRODUTOS200
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos/{_id}
    Validar Status Code "200"
    Validar mensagem "Registro alterado com sucesso"

Cenario C26: PUT Editar Produto 201     #não funciona, token inválido apesar de funcionar nos outros testes
    [tags]      PUTPRODUTOS201
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos/{_id}
    Validar Status Code "201"
    Validar mensagem "Cadastro realizado com sucesso"

Cenario C30: GET Listar Carrinhos 200
    [tags]      GETCARRINHOS200
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario C31: POST Cadastrar Carrinho 201        #incompleto
    [tags]      POSTCARRINHOS201
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    #Verificar a redução da quantidade do produto no estoque