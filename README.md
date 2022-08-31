
<h1 align="center" /> Automação de Testes em API com Robot Framework

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Introdução
Esse repositório contém cenários de testes para todos os endpoints da API ServeRest, utilizando Robot Framework. Abaixo você encontra instruções para instalar e rodar os testes em seu computador, além de informações sobre a API ServeRest e sobre os cenários de testes criados por mim.

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Conteúdos
- [Sobre a API ServeRest](https://github.com/leticianc/Testes_ServeRest_Robot#sobre-a-api-serverest)
- [Ferramentas e Libraries necessárias](https://github.com/leticianc/Testes_ServeRest_Robot#ferramentas-e-libraries-necess%C3%A1rias)
- [Organização do repositório](https://github.com/leticianc/Testes_ServeRest_Robot#organiza%C3%A7%C3%A3o-do-reposit%C3%B3rio)
- [Baixando o repositório](https://github.com/leticianc/Testes_ServeRest_Robot#baixando-o-reposit%C3%B3rio)
- [Rodando os testes](https://github.com/leticianc/Testes_ServeRest_Robot#rodando-os-testes)
- [Relatório de testes](https://github.com/leticianc/Testes_ServeRest_Robot#relat%C3%B3rio-de-testes)

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Sobre a API ServeRest
A API ServeRest é uma API gratuita criada por [Paulo Gonçalves](https://github.com/PauloGoncalvesBH), que simula uma loja virtual e tem como objetivo servir de material de estudos para realização de testes de API. Os testes desse projeto abrangem todas as rotas da ServeRest, seguindo os endpoints `/login`, `/usuarios`, `/produtos` e `/carrinhos`.

![image](https://user-images.githubusercontent.com/106493717/182474137-1105d085-ee6b-4870-ab84-df85bf3b4820.png)

Veja a documentação completa da API ServeRest [aqui](http://serverest.dev/)

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Ferramentas e Libraries necessárias

### Instalando o Python

- [Clique aqui](https://www.python.org/) para acessar o site oficial do Python
- Na guia *Downloads*, clique na versão `3.8.2` e faça o download em seu computador
- Após o download, execute o instalador seguindo os passos até finalizar **(é necessário selecionar a opção Add Python to PATH")**
- Pressione Win+R para abrir a caixa de Executar e digite `cmd`, em seguida aperte o ENTER para abrir o Prompt de Comando
- No Prompt de Comando, digite `python`. Se o Python estiver instalado corretamente, ele será iniciado no terminal como na imagem abaixo.
![image](https://user-images.githubusercontent.com/106493717/182475815-2650a9b0-bea5-470b-8614-cd84c76862f9.png)

![image](https://user-images.githubusercontent.com/106493717/187708431-4ec5347c-0ea6-4039-9925-e6002c5363a4.png)

### Verificando se o Gerenciador de pacotes PIP está atualizado

- Após a instalação do Python, entre novamente no Prompt de Comando 
- Digite `pip list` e aperte ENTER. Serão listadas as bibliotecas presentes no seu dispositivo.
- Caso apareça uma mensagem informando que o PIP não está atualizado, digite o comando `pip install --upgrade pip`

![image](https://user-images.githubusercontent.com/106493717/187708431-4ec5347c-0ea6-4039-9925-e6002c5363a4.png)

### Instalando o Node

- Clique [aqui](https://nodejs.org/en/) para acessar o site oficial do Node.js
- Clique na versão `16.16.0` e faça o download em seu computador
- Após o download, execute o instalador seguindo os passos até finalizar

![image](https://user-images.githubusercontent.com/106493717/187708431-4ec5347c-0ea6-4039-9925-e6002c5363a4.png)

### Instalando o RobotFramework
Execute o seguinte comando no cmd:

```
pip install robotframework
```

![image](https://user-images.githubusercontent.com/106493717/187708431-4ec5347c-0ea6-4039-9925-e6002c5363a4.png)

### Instalando as Libraries 
Execute os seguintes comandos no cmd:

- RequestsLibrary

```
pip install robotframework-requests
```

- FakerLibrary

```
pip install robotframework-faker
```

- RPA Framework (conjunto de libraries)

```
pip install rpaframework
```

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Organização do repositório

A pasta principal desse repositório apresenta o mapa mental da API ServeRest e a pasta `Testes`. A pasta `Testes` está organizada no padrão Service-Objects, e dentro dela estão as pastas `Keywords`, com as keywords utilizadas nos cenários de testes, a pasta `Support`, com todas os arquivos necessários para auxiliar a criação dos cenários de testes, a pasta `Reports`, onde fica armazenado o resultado detalhado dos testes que foram executados, e a pasta  `testes`, com os cenários de testes de cada endpoint.

![image](https://user-images.githubusercontent.com/106493717/182511338-f0b3659f-630a-45ca-89c6-b07b2cb776c5.png)

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Baixando o repositório

Para baixar o repositório, [clique aqui](https://github.com/leticianc/Testes_ServeRest_Robot/archive/refs/heads/main.zip) ou siga os passos abaixo

- Na página inicial do repositório, clique em `Code`, em seguida, clique em `download ZIP`

![image](https://user-images.githubusercontent.com/106493717/187699388-e0472605-3887-48d3-b049-c3de6b3ce0af.png)

- Abra o arquivo baixado, extraia e salve na pasta de sua preferencia

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Rodando os testes
- Instale a ServeRest Local digitando o comando abaixo no cmd:
```
npx serverest
```
- Digite 'y' para confirmar a instalação. A ServeRest local estará em execução no seu computador, não feche essa janela enquanto estiver rodando os testes.

![image](https://user-images.githubusercontent.com/106493717/182490343-d05deaaf-f90d-4d5a-ba6e-fbc7e15e1a6a.png)

- Agora abra a pasta onde você salvou o repositório, entre na pasta `Testes` e copie o caminho da mesma.

- Entre no cmd e digite o comando `cd` seguido do caminho da pasta que foi copiado, como no exemplo abaixo:

![image](https://user-images.githubusercontent.com/106493717/187700554-7388bded-2108-47fd-8970-e6da8b26c698.png)

- Abra uma nova janela do cmd (lembrando que você não deve fechar a janela do cmd com a ServeRest local)

- Para executar os testes por endpoint, digite `robot -d ./reports testes/'endpoint'_tests.robot`, substitundo o 'endpoint' pelo endpoint desejado.

![image](https://user-images.githubusercontent.com/106493717/187708431-4ec5347c-0ea6-4039-9925-e6002c5363a4.png)

No exemplo abaixo temos o comando para executar os testes do endpoint `/usuarios`
```
robot -d ./reports testes/usuarios_tests.robot
```
![image](https://user-images.githubusercontent.com/106493717/187708431-4ec5347c-0ea6-4039-9925-e6002c5363a4.png)

- Para executar um teste específico, você pode usar o comando `robot -d ./reports -i 'tag' testes/'endpoint'_tests.robot` substitundo o 'endpoint' pelo endpoint do teste desejado, e 'tag' pela sua tag 

*No próximo tópico você encontrará todos os cenários de testes e suas respectivas tags* 

![image](https://user-images.githubusercontent.com/106493717/187708431-4ec5347c-0ea6-4039-9925-e6002c5363a4.png)

No exemplo abaixo temos o comando para executar o cenário de teste `35` que faz parte do endpoint `/produtos`
```
robot -d ./reports -i -C35 testes/produtos_tests.robot
``` 

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

## Relatório de testes

Clique no endpoint desejado para ver os cenários de testes, suas tags e uma comparação dos resultados obtidos com os resultados previstos na documentação da API.  

<details><summary>Endpoint /login</summary>

|Cenário|Tag|Esperado|Retornado|
|---|---|---|---|
|C1: POST Fazer Login 200|C1|Status Code: 200 <br /> Mensagem: "Login realizado com sucesso"|Status Code: 200 <br /> Mensagem: "Login realizado com sucesso"|
|C2: POST Fazer Login Email Invalido 400|C2|Status Code: 400 <br /> Mensagem: "Email e/ou senha inválidos"|Status Code: 401 <br /> Mensagem: "Email e/ou senha inválidos"|
|C3: POST Fazer Login Senha Invalida 400|C3|Status Code: 400 <br /> Mensagem: "Email e/ou senha inválidos"|Status Code: 401 <br /> Mensagem: "Email e/ou senha inválidos"|
|C4: POST Fazer Login Sem Email|C4|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "email não pode ficar em branco"|
|C5: POST Fazer Login Sem Senha|C5|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "password não pode ficar em branco"|
|C6: POST Fazer Login Sem Dados|C6|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "email não pode ficar em branco", "password não pode ficar em branco"|
</details>  

<details><summary>Endpoint /usuarios</summary>

|Cenário|Tag|Esperado|Retornado|
|---|---|---|---|
|C7: GET Listar Usuarios 200|C7|Status Code: 200|Status Code: 200|
|C8: GET Buscar Usuario Por ID 200|C8|Status Code: 200|Status Code: 200|
|C9: GET Buscar Usuario Com ID Invalida 400|C9|Status Code: 400 <br /> Mensagem: "Usuário não encontrado"|Status Code: 400 <br /> Mensagem: "Usuário não encontrado"|
|C10: POST Cadastrar Usuario 201|C10|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|
|C11: POST Cadastrar Usuario Sem Nome|C11|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "nome não pode ficar em branco"|
|C12: POST Cadastrar Usuario Sem Email|C12|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "email não pode ficar em branco"|
|C13: POST Cadastrar Usuario Sem Senha|C13|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "password não pode ficar em branco"|
|C14: POST Cadastrar Usuario Sem Administrador|C14|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "administrador deve ser 'true' ou 'false"|
|C15: POST Cadastrar Usuario Email Cadastrado 400|C15|Status Code: 400 <br /> Mensagem: "Este email já está sendo usado"|Status Code: 400 <br /> Mensagem: "Este email já está sendo usado"|
|C16: PUT Editar Usuario 200|C16|Status Code: 200 <br /> Mensagem: "Registro alterado com sucesso"|Status Code: 200 <br /> Mensagem: "Registro alterado com sucesso"|
|C17: PUT Editar Novo Usuario 201|C17|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|
|C18: PUT Editar Novo Usuario Com Email Cadastrado 400|C18|Status Code: 400 <br /> Mensagem: "Este email já está sendo usado"|Status Code: 400 <br /> Mensagem: "Este email já está sendo usado"|
|C19: DELETE Excluir Usuario 200|C19|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso"|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso"|
|C20: DELETE Excluir Usuario Com Carrinho 400|C20|Status Code: 400 <br /> Mensagem: "Não é permitido excluir usuário com carrinho cadastrado"|Status Code: 400 <br /> Mensagem: "Não é permitido excluir usuário com carrinho cadastrado"|
</details> 

<details><summary>Endpoint /produtos</summary>

|Cenário|Tag|Esperado|Retornado|
|---|---|---|---|
|C21: GET Listar Produtos 200|C21|Status Code: 200|Status Code: 200|
|C22: GET Buscar Produto Por ID 200|C22|Status Code: 200|Status Code: 200|
|C23: GET Buscar Produto Com ID Invalida 400|C23|Status Code: 400 <br /> Mensagem: "Produto não encontrado"|Status Code: 400 <br /> Mensagem: "Produto não encontrado"|
|C24: POST Cadastrar Produto 201|C24|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|
|C25: POST Cadastrar Produto Com Nome Existente 400|C25|Status Code: 400 <br /> Mensagem: "Já existe produto com esse nome"|Status Code: 400 <br /> Mensagem: "Já existe produto com esse nome"|
|C26: POST Cadastrar Produto Sem Nome|C26|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "nome não pode ficar em branco"|
|C27: POST Cadastrar Produto Sem Preco|C27|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "preco deve ser um número"|
|C28: POST Cadastrar Produto Sem Descrição|C28|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "descricao não pode ficar em branco"|
|C29: POST Cadastrar Produto Sem Quantidade|C29|Possibilidade não documentada|Status Code: 400 <br /> Mensagem: "quantidade deve ser um número"|
|C30: POST Cadastrar Produto Token Excluido 401|C30|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|
|C31: POST Cadastrar Produto Token Invalido 401|C31|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|
|C32: POST Cadastrar Produto Sem Ser Administrador 403|C32|Status Code: 403 <br /> Mensagem: "Rota exclusiva para administradores"|Status Code: 403 <br /> Mensagem: "Rota exclusiva para administradores"|
|C33: PUT Editar Produto 200|C33|Status Code: 200 <br /> Mensagem: "Registro alterado com sucesso"|Status Code: 200 <br /> Mensagem: "Registro alterado com sucesso"|
|C34: PUT Editar Novo Produto 201|C34|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|
|C35: PUT Editar Novo Produto Com Nome Existente 400|C35|Status Code: 400 <br /> Mensagem: "Já existe produto com esse nome"|Status Code: 400 <br /> Mensagem: "Já existe produto com esse nome"|
|C36: PUT Editar Produto Sem Token 401|C36|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|
|C37: PUT Editar Produto Sem Ser Administrador 403|C37|Status Code: 403 <br /> Mensagem: "Rota exclusiva para administradores"|Status Code: 403 <br /> Mensagem: "Rota exclusiva para administradores"|
|C38: DELETE Excluir Produto 200|C38|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso"|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso"|
|C39: DELETE Excluir Produto em Carrinho 400|C39|Status Code: 400 <br /> Mensagem: "Não é permitido excluir produto que faz parte de carrinho"|Status Code: 400 <br /> Mensagem: "Não é permitido excluir produto que faz parte de carrinho"|
|C40: DELETE Excluir Produto Sem Token 401|C40|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|
|C41: DELETE Excluir Produto Sem Ser Administrador 403|C41|Status Code: 403 <br /> Mensagem: "Rota exclusiva para administradores"|Status Code: 403 <br /> Mensagem: "Rota exclusiva para administradores"|
</details> 

<details><summary>Endpoint /carrinhos</summary>

|Cenário|Tag|Esperado|Retornado|
|---|---|---|---|
|C42: GET Listar Carrinhos 200|C42|Status Code: 200|Status Code: 200|
|C43: GET Buscar Carrinho Por ID|C43|Status Code: 200|Status Code: 200|
|C44: GET Buscar Carrinho Com ID Invalida 400|C44|Status Code: 400 <br /> Mensagem: "Carrinho não encontrado"|Status Code: 400 <br /> Mensagem: "Carrinho não encontrado"|
|C45: POST Cadastrar Carrinho 201|C45|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|Status Code: 201 <br /> Mensagem: "Cadastro realizado com sucesso"|
|C46: POST Carrinho Produto Duplicado 400|C46|Status Code: 400 <br /> Mensagem: "Não é permitido possuir produto duplicado"|Status Code: 400 <br /> Mensagem: "Não é permitido possuir produto duplicado"|
|C47: POST Mais de Um Carrinho 400|C47|Status Code: 400 <br /> Mensagem: "Não é permitido ter mais de 1 carrinho"|Status Code: 400 <br /> Mensagem: "Não é permitido ter mais de 1 carrinho"|
|C48: POST Carrinho Com Quantidade Insuficiente 400|C48|Status Code: 400 <br /> Mensagem: "Produto não possui quantidade suficiente"|Status Code: 400 <br /> Mensagem: "Produto não possui quantidade suficiente"|
|C49: POST Carrinho Produto Não Encontrado 400|C49|Status Code: 400 <br /> Mensagem: "Produto não encontrado"|Status Code: 400 <br /> Mensagem: "Produto não encontrado"|
|C50: POST Cadastrar Carrinho Sem Token 401|C50|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|
|C51: DELETE Excluir Carrinho Concluido 200|C51|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso"|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso"|
|C52: DELETE Excluir Carrinho Concluido Sem Token 401|C52|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|
|C53: DELETE Excluir Carrinho Cancelado 200|C53|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso"|Status Code: 200 <br /> Mensagem: "Registro excluído com sucesso. Estoque dos produtos reabastecido"|
|C54: DELETE Excluir Carrinho Cancelado Sem Token 401|C54|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|Status Code: 401 <br /> Mensagem: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"|
</details> 

### Bugs e sugestões

- Nos testes C2 e C3, o Status Code previsto pela documentação é o "400", porém o Status Code retornado é o "401". Considerei como um bug.
- Os cenários dos testes C4, C5, C6, C11, C12, C13, C14, C26, C27, C28 e C29 não são previstos pela documentação, porém são possíveis e retornam mensagens específicas, seria interessante que essas possibilidades fossem documentadas.
- No teste C43, a mensagem prevista pela documentação é "Registro excluído com sucesso", porém a mensagem retornada é "Registro excluído com sucesso. Estoque dos produtos reabastecido". Também considerei como um bug.

![image](https://user-images.githubusercontent.com/106493717/187707987-7ae60fda-0557-466f-b9ab-c2987f6f3559.png)

