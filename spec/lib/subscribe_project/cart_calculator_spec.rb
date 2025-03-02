require 'spec_helper'
require 'subscribe_project/cart_calculator'
require 'subscribe_project/item'
require 'subscribe_project/strategies/tax_strategy'
require 'subscribe_project/strategies/import_tax_strategy'

RSpec.describe SubscribeProject::CartCalculator do
  let(:cart_calculator) { described_class.new }

  describe '#add_item' do
    it 'adds an item to the cart' do
      cart_calculator.add_item('book', 12.49, 'book', 1)
      expect(cart_calculator.instance_variable_get(:@items).size).to eq(1)
    end
  end

  describe '#total' do
    it 'calculates the total price of all items in the cart' do
      cart_calculator.add_item('book', 12.49, 'book', 2)
      cart_calculator.add_item('music CD', 14.99, 'other', 1)
      cart_calculator.add_item('chocolate bar', 0.85, 'food', 1)
      expect(cart_calculator.total).to eq(42.32)
    end
  end

  describe '#total_taxes' do
    it 'calculates the total taxes for all items in the cart' do
      cart_calculator.add_item('imported bottle of perfume', 27.99, 'other', 1, true)
      cart_calculator.add_item('bottle of perfume', 18.99, 'other', 1)
      cart_calculator.add_item('packet of headache pills', 9.75, 'medical', 1)
      cart_calculator.add_item('imported boxes of chocolates', 11.25, 'food', 3, true)
      expect(cart_calculator.total_taxes).to eq(7.90)
    end
  end
end
