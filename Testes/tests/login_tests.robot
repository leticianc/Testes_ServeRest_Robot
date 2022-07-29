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

Cenario C2: Realizar Login Email Invalido 400  #status code 401 != 400
    [tags]      LOGINEMAILINVALIDO
    POST Endpoint /login Email Invalido
    Validar Mensagem "Email e/ou senha inválidos"    
    Validar Status Code "400"

Cenario C3: Realizar Login Senha Invalida 400   #status code 401 != 400
    [tags]      LOGINSENHAINVALIDA
    POST Endpoint /login Senha Invalida
    Validar Mensagem "Email e/ou senha inválidos"    
    Validar Status Code "400"

Cenario C4: Realizar Login Sem Email    #possibilidade não documentada
    [tags]      LOGINSEMEMAIL
    POST Endpoint /login Sem Email

Cenario C5: Realizar Login Sem Senha    #possibilidade não documentada
    [tags]      LOGINSEMSENHA
    POST Endpoint /login Sem Senha


