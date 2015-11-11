# -*- encoding : utf-8 -*-
module TntMercurio
  module Service
    class CalcularFrete

      def consultar(parametros)
        resposta = web_service.request(parametros)
        helper.build_response_calculo_frete(resposta)
      end

      def self.consultar(parametros)
        self.new.consultar(parametros)
      end

      private

      def web_service
        @web_service ||= TntMercurio::Service::WebService.new
      end

      def helper
        @helper ||= TntMercurio::Service::Helper.new
      end

    end
  end
end
