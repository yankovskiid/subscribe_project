require 'rspec'
require_relative '../lib/subscribe_project/item'

RSpec.describe SubscribeProject::Item do
  let(:item) { described_class.new(name: 'Book', price: 12.99, type: 'Book', quantity: 1, imported: false) }

  describe '#initialize' do
    it 'assigns the correct attributes' do
      expect(item.name).to eq('Book')
      expect(item.price).to eq(12.99)
      expect(item.type).to eq('Book')
      expect(item.quantity).to eq(1)
      expect(item.imported).to be false
    end
  end
end
