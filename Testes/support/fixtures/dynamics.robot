* Settings *
Documentation   Keywords e variáveis para geração massa de dados
Library         FakerLibrary    locale=pt_br
Library         RPA.JSON

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
    ${quant_original}       Set Variable        ${quantidade}      
    Set GLobal Variable     ${payload}
    Set Global Variable     ${quant_original} 


Criar Dados Carrinho Valido
    ${quantidade}           FakerLibrary.RandomNumber   digits=1    fix_len=true
    ${produtos}             Convert String to JSON      [{"idProduto": "id", "quantidade": 1}]
    ${produtos}             Update Value to JSON        ${produtos}     $..quantidade   ${quantidade}
    ${produtos}             Update Value to JSON        ${produtos}     $..idProduto    ${id_produto}
    &{payload}              Create Dictionary           produtos=${produtos}
    ${quant_carrinho}       Set Variable                ${quantidade}
    Set GLobal Variable     ${payload}
    Set Global Variable     ${quant_carrinho}
