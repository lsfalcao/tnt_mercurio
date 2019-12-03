# -*- encoding : utf-8 -*-
module TntMercurio
  module Service
    module Configuracao
      #
      # Configurações padrões
      URL                               = 'http://ws.tntbrasil.com.br/servicos/CalculoFrete?wsdl' # Endereço do wsdl
      DIVISAO_CLIENTE                   = 1     # Padrão utilizado pela TNT Mercúrio
      SITUACAO_TRIBUTARIA_DESTINATARIO  = 'CN'  # Cia Mista Não Contribuinte
      SITUACAO_TRIBUTARIA_REMETENTE     = 'CO'  # Contribuinte
      TIPO_PESSOA_REMETENTE             = 'J'   # Jurídica
      TIPO_PESSOA_DESTINATARIO          = 'F'   # Física
      TIPO_SERVICO                      = 'RNC' # RNC Rodoviário Nacional
      TIPO_FRETE                        = 'C'   # C - CIF
      attr_writer :divisao_cliente, :situacao_tributaria_destinatario, :situacao_tributaria_remetente,
                  :tipo_pessoa_remetente, :tipo_pessoa_destinatario, :tipo_servico, :tipo_frete

      #
      # Comando que recebe as configuracoes
      def configure
        yield self if block_given?
      end

      #
      # Opções para Divisão cliente
      # Long numérico com o código da divisão do cliente.
      # Ligar para o Comercial para pedir esta informação.
      def divisao_cliente
        @divisao_cliente ||= DIVISAO_CLIENTE
      end

      #
      # Opções para Situação Tributaria do Remetente e Destinatário
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
      def situacao_tributaria_destinatario
        @situacao_tributaria_destinatario ||= SITUACAO_TRIBUTARIA_DESTINATARIO
      end
      def situacao_tributaria_remetente
        @situacao_tributaria_remetente ||= SITUACAO_TRIBUTARIA_REMETENTE
      end

      #
      # Opções para Tipo de Pessoa do Remetente e Destinatário
      # F (Física) ou J (Jurídica)
      def tipo_pessoa_remetente
        @tipo_pessoa_remetente ||= TIPO_PESSOA_REMETENTE
      end
      def tipo_pessoa_destinatario
        @tipo_pessoa_destinatario ||= TIPO_PESSOA_DESTINATARIO
      end

      #
      # Opções para Tipo de Modalidade: String de três posições.
      # 'RNC' Rodoviário Nacional
      # 'ANC' Aéreo Nacional.
      def tipo_servico
        @tipo_servico ||= TIPO_SERVICO
      end

      #
      # Opções para Tipo de Cobrança do Frete: String de 1
      # 'C' - CIF
      # 'F' - FOB
      def tipo_frete
        @tipo_frete ||= TIPO_FRETE
      end

      #
      # Montar o Hash de configurações
      def configuracoes_calculo_frete
        configuracoes = {
          "mod:cdDivisaoCliente" => divisao_cliente,
          "mod:tpSituacaoTributariaDestinatario" => situacao_tributaria_destinatario,
          "mod:tpSituacaoTributariaRemetente" => situacao_tributaria_remetente,
          "mod:tpPessoaRemetente" => tipo_pessoa_remetente,
          "mod:tpPessoaDestinatario" => tipo_pessoa_destinatario,
          "mod:tpServico" => tipo_servico,
          "mod:tpFrete" => tipo_frete,
        }
        return configuracoes
      end

    end
  end
end
