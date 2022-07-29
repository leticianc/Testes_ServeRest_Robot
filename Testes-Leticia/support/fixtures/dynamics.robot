* Settings *
Documentation   Keywords e variáveis para geração massa de dados
Library         FakerLibrary

* Keywords *
Criar Dados Usuario Valido
    ${nome}     FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${payload}  Create Dictionary   nome=${nome}    email=${email}  password=senha123  administrador=true
    Set GLobal Variable     ${payload}

Criar Dados Produto Valido
    ${nome_produto}     FakerLibrary.Word
    ${preco}    FakerLibrary.RandomNumber               digits=3        fix_len=true
    ${descricao}    FakerLibrary.ColorName
    ${quantidade}   FakerLibrary.RandomNumber           digits=3        fix_len=true
    ${payload}  Create Dictionary   nome=${nome_produto}    preco=${preco}  descricao=${descricao}  quantidade=${quantidade}
    Set GLobal Variable     ${payload}