require_relative '../config_loader'

module SubscribeProject
  module Strategies
    class TaxStrategy
      def initialize(config = ConfigLoader.load_config)
        @config = config
      end

      def tax_rate(type)
        exempt_tax_type?(type) ? exempt_rate : default_rate
      end

      private

      attr_reader :config

      def exempt_tax_type?(type)
        config['exempt_tax_types'].include?(type)
      end

      def exempt_rate
        config['tax_rates']['exempt_rate']
      end

      def default_rate
        config['tax_rates']['default_rate']
      end
    end
  end
end
