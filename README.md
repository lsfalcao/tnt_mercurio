# TNT Mercúrio

Gem para utilização do Webservices disponibilizado pela empresa [TNT Mercúrio](http://www.tnt.com/express/pt_br/site/home/applications/mercurio_traking.html) para calculo do valor de frete e localização da entrega.

Versão Beta

## Instalando

### Gemfile

Adicione esta linha ao Gemfile do seu aplicativo:

```ruby
  gem 'tnt_mercurio'
```

Então execute:

```ruby
  $ bundle install
```

### Instalação direta

```ruby
  $ gem install tnt_mercurio
```
## Usando

### CalcularFrete

Cálculo do valor de frete passando os parâmetros em Hash. Todas os parâmetros são obrigatórios.

```ruby
  require 'tnt_mercurio'

  # Build parametros to CalcularFrete
  parametros = {
    login: 'e-mail cadastrado na TNT Mercúrio',
    cep_origem: '13560320',
    cnpj_remetente: 'CNPJ cadastrado na TNT Mercúrio',
    ie_remetente: 'Inscrição Estadual cadastrado na TNT Mercúrio',

    cep_destino: '13560320',
    cpf_destinatario: 'CPF do Destinatário',

    valor_total: '1500.00',
    peso: '5.000',
  }

  # With "consultar" instance method
  frete = TntMercurio::Service::CalcularFrete.new
  calculo = frete.consultar(parametros)

  # With "consultar" class method
  calculo = TntMercurio::Service::CalcularFrete.consultar(parametros)
```
O Retorno será um Hash no formato abaixo.

```ruby
  calculo # =>
  {
    :sucesso?       => true,
    :error          => '',
    :valor          => "39.9",
    :prazo_entrega  => "1"
  }
```

### Localizacao

Em breve

## Configurações

### As configurações padrões:

```ruby
  SITUACAO_TRIBUTARIA_DESTINATARIO  = 'CN'  # Cia Mista Não Contribuinte
  SITUACAO_TRIBUTARIA_REMETENTE     = 'CO'  # Contribuinte
  TIPO_PESSOA_REMETENTE             = 'J'   # Jurídica
  TIPO_PESSOA_DESTINATARIO          = 'F'   # Física
  TIPO_SERVICO                      = 'RNC' # RNC Rodoviário Nacional
  TIPO_FRETE                        = 'C'   # C - CIF
```

### Exemplo de configurações

Adicionar as cofigurações abaixo ao arquivo config/initializers/tnt_mercurio.rb

```ruby
  TntMercurio::Service.configure do |config|

    #
    # Opções para Situação Tributaria do Remetente e Destinatário
    # String de duas posições.
    # 'CO' (Contribuinte)
    # 'NC' (Não Contribuinte)
    # 'CI' (Contrib Incentivado)
    # 'CM' (Contrib Incentivado)
    # 'CN' (Cia Mista Não Contribuinte)
    # 'ME' (ME / EPP / Simples Nacional Contribuinte)
    # 'MN' (ME / EPP / Simples Nacional Não Contribuinte)
    # 'PR' (Produtor Rural Contribuinte)
    # 'PN' (Produtor Rural Não Contribuinte)
    # 'OP' (Órgão Público Contribuinte)
    # 'ON' (Órgão Público Não Contribuinte)
    # 'OF' (Órgão Público - Programas de fortalecimento e modernização Estadual)
    config.situacao_tributaria_destinatario = 'CN'
    config.situacao_tributaria_remetente = 'CO'

    #
    # Opções para Tipo de Pessoa do Remetente e Destinatário
    # String de uma posições.
    # F (Física) ou J (Jurídica)
    config.tipo_pessoa_remetente = 'J'
    config.tipo_pessoa_destinatario = 'F'

    #
    # Opções para Tipo de Modalidade
    # String de três posições.
    # 'RNC' Rodoviário Nacional
    # 'ANC' Aéreo Nacional.
    config.tipo_servico = 'RNC'

    #
    # Opções para Tipo de Cobrança do Frete
    # String de uma posições.
    # 'C' - CIF
    # 'F' - FOB
    config.tipo_frete = 'C'

  end
```

## Autor
- [QW3 Software & Marketing](http://qw3.com.br)

## Copyright

[QW3 Software & Marketing](http://qw3.com.br)

![QW3 Logo](http://qw3.com.br/qw3_logo.png)

The MIT License (MIT)

Copyright (c) 2015 QW3

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
