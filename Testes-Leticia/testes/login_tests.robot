* Settings *
Documentation       Arquivo de testes para endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

* Test Cases *
Cenario C1: POST Fazer Login 200
    [tags]      C1
    Criar Usuario Dinamico e Armazenar Dados
    POST Endpoint /login
    Mostrar payload
    Validar Mensagem "Login realizado com sucesso"
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenario C2: POST Fazer Login Email Invalido 400
    [tags]      C2
    POST Fazer Login "Email_Invalido"
    Mostrar payload
    Validar Mensagem "Email e/ou senha inválidos"    
    Validar Status Code "400"

Cenario C3: POST Fazer Login Senha Invalida 400
    [tags]      C3
    POST Fazer Login "Senha_Invalida"
    Mostrar payload
    Validar Mensagem "Email e/ou senha inválidos"    
    Validar Status Code "400"

Cenario C4: POST Fazer Login Sem Email
    [tags]      C4
    POST Fazer Login "Sem_Email"
    Mostrar payload
    Mostrar Resposta

Cenario C5: POST Fazer Login Sem Senha
    [tags]      C5
    POST Fazer Login "Sem_Senha"
    Mostrar payload
    Mostrar Resposta

Cenario C6: POST Fazer Login Sem Dados
    [tags]      C6
    POST Fazer Login "Sem_Dados"
    Mostrar payload
    Mostrar Resposta
