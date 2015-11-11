# -*- encoding : utf-8 -*-
module TntMercurio
  module Service
    class Localizacao

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
