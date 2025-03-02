require 'rspec'
require 'subscribe_project/input_reader'

RSpec.describe SubscribeProject::InputReader do
  describe '.read_input' do
    before do
      # Mocking the user input
      allow(STDIN).to receive(:gets).and_return("1 imported apple at 10.00\n", "2 pills at 5.00\n", "done\n")
    end

    it 'prompts the user to enter items' do
      expect { described_class.read_input }.to output("Please enter the items (type 'done' to finish):\n").to_stdout
    end

    it 'reads multiple lines of input until "done" is entered' do
      result = described_class.read_input
      expect(result).to eq("1 imported apple at 10.00\n2 pills at 5.00\n")
    end
  end
end
