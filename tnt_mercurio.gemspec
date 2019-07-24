# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'tnt_mercurio/version'

Gem::Specification.new do |gem|
  gem.name                  = "tnt_mercurio"
  gem.version               = TntMercurio::VERSION
  gem.authors               = ["Leandro Falcão"]
  gem.email                 = ["le.sfalcao@gmail.com"]
  gem.summary               = "Calcula Frete pelo TNT Mercúrio"
  gem.description           = "Gem para utilização do Webservices disponibilizado pela empresa TNT Mercúrio."
  gem.homepage              = "https://github.com/lsfalcao/tnt_mercurio"
  gem.license               = "MIT"

  gem.files                 = [
                                "lib/tnt_mercurio.rb",
                                "lib/tnt_mercurio/version.rb",
                                "lib/tnt_mercurio/service.rb",
                                "lib/tnt_mercurio/service/calcula_frete.rb",
                                "lib/tnt_mercurio/service/helper.rb",
                                "lib/tnt_mercurio/service/configuracao.rb",
                                "lib/tnt_mercurio/service/web_service.rb",
                              ]
  gem.require_paths         = ["lib"]

  gem.platform              = Gem::Platform::RUBY
  gem.required_ruby_version = Gem::Requirement.new(">= 1.9")

  gem.add_runtime_dependency "savon",       ">= 2.11.1"
end
