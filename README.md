
<h1 align="center" /> RoboTron - Sprint 6

<div align="center"><img src="https://user-images.githubusercontent.com/106493717/176893891-701d7121-0d6c-482c-a0b9-49d7c1547cae.png" width="400" height="auto"></div>

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Introdução
Esse repositório apresenta o último Challenge do Programa de Bolsas RoboTron. O projeto está organizado no padrão Service-Objects conforme foi orientado pelo Scrum Master Demétrio Webber e apresenta testes para todos os endpoints da API ServeRest, utilizando Robot Framework. Abaixo você encontra instruções para instalar e rodar os testes em seu computador, além de informações sobre a API ServeRest e sobre os cenários de testes criados por mim.

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Conteúdos
- [Sobre a API ServeRest](https://github.com/leticianc/Robotron_Leticia_Nunes_ProjetoFinal/edit/main/README.md#sobre-a-api-serverest)
- [Ferramentas e Libraries necessárias](https://github.com/leticianc/Robotron_Leticia_Nunes_ProjetoFinal/edit/main/README.md#ferramentas-e-libraries-necess%C3%A1rias)
- [Baixando o repositório](https://github.com/leticianc/Robotron_Leticia_Nunes_ProjetoFinal/edit/main/README.md#baixando-o-reposit%C3%B3rio)
- [Rodando os testes](https://github.com/leticianc/Robotron_Leticia_Nunes_ProjetoFinal/edit/main/README.md#rodando-os-testes)
- [Relatório de testes](https://github.com/leticianc/Robotron_Leticia_Nunes_ProjetoFinal/edit/main/README.md#sobre-os-testes)
- [Créditos](https://github.com/leticianc/Robotron_Leticia_Nunes_ProjetoFinal/edit/main/README.md#cr%C3%A9ditos)
- [Agradecimentos]()

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Sobre a API ServeRest
A API ServeRest é uma API gratuita criada por [Paulo Gonçalves](https://github.com/PauloGoncalvesBH), que simula uma loja virtual e tem como objetivo servir de material de estudos para realização de testes de API. Os testes desse projeto abrangem todas as rotas da ServeRest, seguindo os endpoints `/login`, `/usuarios`, `/produtos` e `/carrinhos`.

![image](https://user-images.githubusercontent.com/106493717/182474137-1105d085-ee6b-4870-ab84-df85bf3b4820.png)

Veja a documentação completa da API ServeRest [aqui](http://serverest.dev/)

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Ferramentas e Libraries necessárias

### Instalando o Python

- [Clique aqui](https://www.python.org/) para acessar o site oficial do Python
- Na guia *Downloads*, clique na versão `3.8.2` e faça o download em seu computador
- Após o download, execute o instalador seguindo os passos até finalizar **(é necessário selecionar a opção Add Python to PATH")**
- Pressione Win+R para abrir a caixa de Executar e digite `cmd`, em seguida aperte o ENTER para abrir o Prompt de Comando
- No Prompt de Comando, digite `python`. Se o Python estiver instalado corretamente, ele será iniciado no terminal como na imagem abaixo.
![image](https://user-images.githubusercontent.com/106493717/182475815-2650a9b0-bea5-470b-8614-cd84c76862f9.png)

![image](https://user-images.githubusercontent.com/106493717/182480116-1b388aa2-5c0b-4732-abca-35ec71b6f7e0.png)

### Verificando se o Gerenciador de pacotes PIP está atualizado

- Após a instalação do Python, entre novamente no Prompt de Comando 
- Digite `pip list` e aperte ENTER. Serão listadas as bibliotecas presentes no seu dispositivo.
- Caso apareça uma mensagem informando que o PIP não está atualizado, digite o comando `pip install --upgrade pip`

![image](https://user-images.githubusercontent.com/106493717/182480116-1b388aa2-5c0b-4732-abca-35ec71b6f7e0.png)

### Instalando o Node

- Clique [aqui](https://nodejs.org/en/) para acessar o site oficial do Node.js
- Clique na versão `16.16.0` e faça o download em seu computador
- Após o download, execute o instalador seguindo os passos até finalizar

![image](https://user-images.githubusercontent.com/106493717/182480116-1b388aa2-5c0b-4732-abca-35ec71b6f7e0.png)

### Instalando o RobotFramework
Execute o seguinte comando no cmd:

```
pip install robotframework
```

![image](https://user-images.githubusercontent.com/106493717/182480116-1b388aa2-5c0b-4732-abca-35ec71b6f7e0.png)

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

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Baixando o repositório
Para baixar o repositório, [clique aqui](https://github.com/leticianc/Robotron_Leticia_Nunes_ProjetoFinal/archive/refs/heads/main.zip) ou siga os passos abaixo

- Na página inicial do repositório, clique em `Code`, em seguida, clique em `download ZIP`

![image](https://user-images.githubusercontent.com/106493717/182482469-fad2d0e2-0589-4926-84f9-3f157aa435a8.png)

- Abra o arquivo baixado, extraia e salve na pasta de sua preferencia

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Rodando os testes
- Instale a ServeRest Local digitando o comando abaixo no cmd:
```
npx serverest
```
- Digite 'y' para confirmar a instalação. A ServeRest local estará em execução no seu computador, não feche essa janela enquanto estiver rodando os testes.

![image](https://user-images.githubusercontent.com/106493717/182490343-d05deaaf-f90d-4d5a-ba6e-fbc7e15e1a6a.png)

- Agora abra a pasta onde você salvou o repositório, entre na pasta `Testes` e copie o caminho da mesma.

- Entre no cmd e digite o comando `cd` seguido do caminho da pasta que foi copiado, como no exemplo abaixo:

![image](https://user-images.githubusercontent.com/106493717/182493263-0327c712-330f-4a3b-9db0-107180ee690e.png)

- Abra uma nova janela do cmd (lembrando que você não deve fechar a janela do cmd com a ServeRest local)

- Para executar os testes por endpoint, digite `robot -d ./reports testes/'endpoint'_tests.robot`, substitundo o 'endpoint' pelo endpoint desejado.

![image](https://user-images.githubusercontent.com/106493717/182494886-7885a4a7-08ab-4587-a40f-9cb876c47187.png)

No exemplo abaixo temos o comando para executar os testes do endpoint `/usuarios`
```
robot -d ./reports testes/usuarios_tests.robot
```
![image](https://user-images.githubusercontent.com/106493717/182494886-7885a4a7-08ab-4587-a40f-9cb876c47187.png)

- Para executar um teste específico, você pode usar o comando `robot -d ./reports -i 'tag' testes/'endpoint'_tests.robot` substitundo o 'endpoint' pelo endpoint do teste desejado, e 'tag' pela sua tag 

*no próximo tópico você encontrará todos os cenários de testes e suas respectivas tags* 

![image](https://user-images.githubusercontent.com/106493717/182494886-7885a4a7-08ab-4587-a40f-9cb876c47187.png)

No exemplo abaixo temos o comando para executar o cenário de teste `35` que faz parte do endpoint `/produtos`
```
robot -d ./reports -i -C35 testes/produtos_tests.robot
``` 

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Relatório de testes

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Créditos

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)

## Agradecimentos

![image](https://user-images.githubusercontent.com/106493717/182469833-f1c1b52a-662b-45f6-8bc6-24b1cedcdead.png)




