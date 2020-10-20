require 'httparty'

Dado('o CEP {string}') do |cep|
  $uri_base="https://viacep.com.br/ws/#{cep}/json/"
end

Quando('realizar a consulta') do
  $response = HTTParty.get($uri_base)
end

Então('vejo o status {int}') do |status_code|
  response = HTTParty.get($uri_base)
  Kernel.puts "response code #{$response.code}"
  Kernel.puts "response code #{$response.code.equal?(status_code)}"
  Kernel.puts "IBGE #{response.parsed_response["ibge"]}"
  Kernel.puts "response body #{$response.body}"
end

Dado('consulto um {string} inválido') do |cep|
  $var = cep
  $uri_base="https://viacep.com.br/ws/#{cep}/json/"
end

Então('vejo o uma falha {int}') do |status_code|
  Kernel.puts"O CEP #{$var} não foi encontrado"
  Kernel.puts "response code #{$response.code}"
  Kernel.puts "response code #{$response.code.equal?(status_code)}"
end

