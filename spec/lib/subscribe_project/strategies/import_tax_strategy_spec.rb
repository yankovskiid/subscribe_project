require 'rspec'
require 'subscribe_project/strategies/import_tax_strategy'

module SubscribeProject
  module Strategies
    RSpec.describe ImportTaxStrategy do
      let(:config) { { 'tax_rates' => { 'import' => 0.05 } } }
      let(:strategy) { ImportTaxStrategy.new(config) }

      describe '#import_tax' do
        context 'when the item is imported' do
          it 'returns the import tax rate' do
            expect(strategy.import_tax(true)).to eq(0.05)
          end
        end

        context 'when the item is not imported' do
          it 'returns zero' do
            expect(strategy.import_tax(false)).to eq(0)
          end
        end
      end
    end
  end
end
