require_relative '../config_loader'

module SubscribeProject
  module Strategies
    class ImportTaxStrategy
      ZERO_IMPORT_TAX_RATE = 0

      def initialize(config = ConfigLoader.load_config)
        @config = config
      end

      def import_tax(imported)
        imported ? config['import_tax_rate'] : ZERO_IMPORT_TAX_RATE
      end

      private

      attr_reader :config
    end
  end
end
