# -*- encoding : utf-8 -*-
require 'savon'

module TntMercurio
  module Service
    class WebService

      attr_reader :savon_client

      def initialize
        @savon_client = Savon.client(
          wsdl: ::TntMercurio::Service::Configuracao::URL,
          convert_request_keys_to: :lower_camelcase,
          namespaces: { "xmlns:tns" => "http://model.vendas.lms.mercurio.com",
                        "xmlns:mod" => "http://model.vendas.lms.mercurio.com" },
        )
      end

      def request(parametros = {})
        # Monta os parâmetros
        params = helper.build_request_calculo_frete(parametros)

        # Faz a requisição para o wsdl
        begin
          retorno = @savon_client.call(:calcula_frete, message: params)
          # Coverte a resposta
          resposta = retorno.to_array.first unless retorno.blank?
        rescue Savon::SOAPFault => error
          return helper.build_response_calculo_frete({error: error.to_hash[:fault][:faultstring]})
        end

        # Verifica se a resposta veio correta ou se deu problema
        if resposta.blank?
          return {error: true}
        else
          return resposta
        end
      end

      private

      def helper
        @helper ||= TntMercurio::Service::Helper.new
      end

    end
  end
end
