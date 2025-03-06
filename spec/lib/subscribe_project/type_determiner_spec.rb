require 'rspec'
require 'subscribe_project/type_determiner'

RSpec.describe SubscribeProject::TypeDeterminer do
  let(:config) do
    {
      'product_types' => {
        'food' => ['apple', 'banana'],
        'medical' => ['aspirin', 'bandage'],
        'book' => ['Harry Potter', 'Lord of the Rings']
      }
    }
  end

  describe '.determine' do
    it 'returns "food" for food items' do
      expect(described_class.determine('apple pie', config)).to eq('food')
    end

    it 'returns "medical" for medical items' do
      expect(described_class.determine('aspirin bottle', config)).to eq('medical')
    end

    it 'returns "book" for book items' do
      expect(described_class.determine('Harry Potter book', config)).to eq('book')
      expect(described_class.determine('Lord of the Rings novel', config)).to eq('book')
    end

    it 'returns "other" for items not in the config' do
      expect(described_class.determine('chair', config)).to eq('other')
    end
  end
end
