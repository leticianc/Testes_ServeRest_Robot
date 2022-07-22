* Settings *
Documentation       Arquivo de testes para endpoint /carrinhos
Resource            ../keywords/carrinhos_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C30: GET Listar Carrinhos 200
    [tags]      GETCARRINHOS200
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario C31: POST Cadastrar Carrinho 201        #incompleto
    [tags]      POSTCARRINHOS201
    Fazer Login e Armazenar Token
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    #Verificar a redução da quantidade do produto no estoque