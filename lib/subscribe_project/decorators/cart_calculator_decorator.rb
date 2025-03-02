require_relative '../cart_calculator'

module SubscribeProject
  module Decorators
    class CartCalculatorDecorator
      def initialize(cart_calculator)
        @cart_calculator = cart_calculator
      end

      def receipt
        receipt_lines.join("\n")
      end

      private

      attr_reader :cart_calculator

      def receipt_lines
        [
          *cart_calculator.items.map { |item| format_item(item) },
          format_taxes,
          format_total
        ]
      end

      def format_item(item)
        "#{item.quantity} #{'imported ' if item.imported}#{item.name}: #{'%.2f' % cart_calculator.item_total_price(item)}"
      end

      def format_taxes
        "Sales Taxes: #{'%.2f' % cart_calculator.total_taxes}"
      end

      def format_total
        "Total: #{'%.2f' % cart_calculator.total}"
      end
    end
  end
end
