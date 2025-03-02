require 'spec_helper'
require 'subscribe_project/strategies/tax_strategy'

RSpec.describe SubscribeProject::Strategies::TaxStrategy do
  let(:config) do
    {
      'exempt_tax_types' => ['food', 'medicine'],
      'tax_rates' => {
        'exempt_rate' => 0.0,
        'default_rate' => 0.1
      }
    }
  end

  subject { described_class.new(config) }

  describe '#tax_rate' do
    context 'when the type is exempt' do
      it 'returns the exempt rate' do
        expect(subject.tax_rate('food')).to eq(0.0)
      end
    end

    context 'when the type is not exempt' do
      it 'returns the default rate' do
        expect(subject.tax_rate('electronics')).to eq(0.1)
      end
    end
  end
end
