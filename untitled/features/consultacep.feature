#language: pt
@startup
@consulta_cep
Funcionalidade: Consulta CEP

  Para que eu possa obter os dados de um endereço
  Sendo um usuário que deseja consultar o CEP
  Posso acessar a lista de dados do CEP fornecido

  @cep_valido
  Cenário: CEP válido
    Dado o CEP '01001000'
    Quando realizar a consulta
    Então vejo o status 200


  @cep_invalido
  Esquema do Cenário: CEP inválido
    Dado consulto um <CEP> inválido
    Quando realizar a consulta
    Então vejo o uma falha 400
    Exemplos:
      | CEP         |
      | "950100100" |
      | "950100999" |