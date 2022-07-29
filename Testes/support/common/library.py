import json

def Buscar_Produto_Sem(palavra):
    def retornar_json():
        with open ("./fixtures/static/json_produtos_ex.json", encoding="utf-8") as json_normal:
            json_manipulavel = json.load(json_normal)  # trasforma o JSON em um dicionário
            return json_manipulavel


json_retornado = retornar_json()
nome = (json_retornado["semnome")]
preco = (json_retornado["sempreco"])