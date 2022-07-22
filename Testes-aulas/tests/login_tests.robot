* Settings *
Documentation       Arquivo de testes para endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario: POST Realizar Login 200
    [tags]      POSTLOGIN
    POST Endpoint /login
    Validar Status Code "200"