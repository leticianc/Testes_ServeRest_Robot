* Settings *
Documentation       Arquivo de testes para endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *

Cenario C1: Realizar Login Valido
    [tags]      LOGINVALIDO
    POST Endpoint /login User Valido
    Validar Status Code "200"
    Validar Mensagem "Login realizado com sucesso"
    Validar Ter Logado

Cenario C2: Realizar Login Email Invalido  #status code 401 != 400
    [tags]      LOGINEMAILINVALIDO
    POST Endpoint /login Email Invalido
    Validar Status Code "401"
    Validar Mensagem "Email e/ou senha inválidos"

Cenario C3: Realizar Login Senha Invalida  #status code 401 != 400
    [tags]      LOGINSENHAINVALIDA
    POST Endpoint /login Senha Invalida
    Validar Status Code "401"
    Validar Mensagem "Email e/ou senha inválidos"

Cenario C4: Realizar Login Sem Email    #possibilidade não documentada
    [tags]      LOGINSEMEMAIL
    POST Endpoint /login Sem Email

Cenario C5: Realizar Login Sem Senha    #possibilidade não documentada
    [tags]      LOGINSEMSENHA
    POST Endpoint /login Sem Senha


