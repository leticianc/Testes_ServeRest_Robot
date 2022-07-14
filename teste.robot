#Sessão para confirguração, documentação, imports de arquivos e libraries
* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary


#Sessão para setagem de variáveis para utilização
* Variables *



#Sessão para criação dos cenários de teste
* Test Cases *
Cenario: PUT Editar Usuario 200
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"    


#Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest   https://serverest.dev

PUT Endpoint /usuarios
    &{payload}              Create Dictionary   nome=usuario diferente   email=emaildiferente@gmail.com  password=123    administrador=true
    ${response}             POST On Session     serverest   /usuarios/YSqAvahgJDM1O9j3   data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}
    
Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}