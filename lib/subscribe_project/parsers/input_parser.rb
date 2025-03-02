require_relative '../type_determiner'
require_relative '../config_loader'

module SubscribeProject
  module Parsers
    class InputParser
      ITEM_STRING_REGEX = /(\d+) (imported )?(.+) at (\d+\.\d+)/.freeze

      def self.parse(input, config: ConfigLoader.load_config)
        input.lines.map { |line| parse_line(line, config) }
      end

      def self.parse_line(line, config)
        match = line.match(ITEM_STRING_REGEX)
        raise ArgumentError, "Invalid input format: #{line.strip}" unless match

        quantity, imported, name, price = extract_match_data(match)
        type = TypeDeterminer.determine(name, config)

        { quantity: quantity, name: name, price: price, type: type, imported: imported }
      end

      def self.extract_match_data(match)
        quantity = match[1].to_i
        imported = !match[2].nil?
        name = match[3]
        price = match[4].to_f
        [quantity, imported, name, price]
      end
    end
  end
end
