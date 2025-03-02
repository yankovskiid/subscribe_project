require 'yaml'
require_relative 'config_loader'
require_relative 'item'
require_relative 'strategies/tax_strategy'
require_relative 'strategies/import_tax_strategy'

module SubscribeProject
  class CartCalculator
    attr_reader :items

    def initialize(tax_strategy = Strategies::TaxStrategy.new, import_tax_strategy = Strategies::ImportTaxStrategy.new)
      @items = []
      @tax_strategy = tax_strategy
      @import_tax_strategy = import_tax_strategy
    end

    def add_item(name, price, type, quantity, imported = false)
      items << Item.new(name:, price:, type:, quantity:, imported:)
    end

    def item_total_price(item)
      (item.price + item_total_tax(item)) * item.quantity
    end

    def total
      items.sum { |item| item_total_price(item) }
    end

    def total_taxes
      items.sum { |item| item_total_tax(item) * item.quantity }
    end

    private

    attr_writer :items
    attr_reader :tax_strategy, :import_tax_strategy

    def item_total_tax(item)
      tax = tax_strategy.tax_rate(item.type)
      import_tax = import_tax_strategy.import_tax(item.imported)
      total_tax = item.price * (tax + import_tax)
      (total_tax * 20).ceil / 20.0  # rounding up to the nearest 0.05
    end
  end
end
