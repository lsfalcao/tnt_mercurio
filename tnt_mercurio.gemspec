# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'tnt_mercurio/version'

Gem::Specification.new do |gem|
  gem.name                  = "tnt_mercurio"
  gem.version               = TntMercurio::VERSION
  gem.authors               = ["QW3 Software & Marketing"]
  gem.email                 = ["contato@qw3.com.br"]
  gem.summary               = "Calcula Frete pelo TNT Mercúrio"
  gem.description           = "Gem para utilização do Webservices disponibilizado pela empresa TNT Mercúrio."
  gem.homepage              = "https://github.com/qw3/tnt_mercurio"
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

  gem.add_runtime_dependency "savon",       "~> 2.10"

  gem.add_development_dependency "rake",    "~> 10.4"
end
