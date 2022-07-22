* Settings *
Documentation   Keywords e variáveis para geração massa de dados
Library         FakerLibrary

* Keywords *
Criar Dados Usuario Valido
    ${nome}     FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${payload}  Create Dictionary   nome=${nome}    email=${email}  password=senha123  administrador=true
    Log to Console          ${payload}
    Set GLobal Variable     ${payload}
