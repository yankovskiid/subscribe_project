require 'rspec'
require 'subscribe_project/parsers/input_parser'
require 'subscribe_project/config_loader'

RSpec.describe SubscribeProject::Parsers::InputParser do
  let(:config) do
    {
      'tax_rates' => { 'import' => 0.05 },
      'product_types' => {
        'food' => ['apple', 'banana'],
        'medical' => ['pills', 'bandage']
      }
    }
  end

  describe '.parse' do
    it 'parses multiple lines of input' do
      input = "1 imported apple at 10.00\n2 pills at 5.00"
      result = described_class.parse(input, config: config)
      expect(result).to eq([
        { quantity: 1, name: 'apple', price: 10.0, type: 'food', imported: true },
        { quantity: 2, name: 'pills', price: 5.0, type: 'medical', imported: false }
      ])
    end
  end

  describe '.parse_line' do
    it 'parses a single line of input' do
      line = "1 imported apple at 10.00"
      result = described_class.parse_line(line, config)
      expect(result).to eq({ quantity: 1, name: 'apple', price: 10.0, type: 'food', imported: true })
    end

    it 'raises an error for invalid input format' do
      line = "invalid input"
      expect { described_class.parse_line(line, config) }.to raise_error(ArgumentError, "Invalid input format: invalid input")
    end
  end
end
