* Settings *
Documentation   Keywords e variáveis para ações do endpoint /carrinhos
Resource        ../support/base.robot

* Keywords *

GET Endpoint /carrinhos
    ${response}             GET On Session      serverest       /carrinhos
    Set Global Variable     ${response}
