#Sessão para confirguração, documentação, imports de arquivos e libraries
* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Resource            ./common/common.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variaveis/serverest_variaveis.robot
    
#Sessão para criação de Keywords Personalizadas
* Keywords *
Criar Sessao
    Create Session          serverest   ${BASE_URI}
