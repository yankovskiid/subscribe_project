#!/usr/bin/env ruby

require_relative '../lib/subscribe_project/cart_calculator'
require_relative '../lib/subscribe_project/parsers/input_parser'
require_relative '../lib/subscribe_project/input_reader'
require_relative '../lib/subscribe_project/decorators/cart_calculator_decorator'

begin
  puts 'Start:'
  input = SubscribeProject::InputReader.read_input
  parsed_items = SubscribeProject::Parsers::InputParser.parse(input)

  cart = SubscribeProject::CartCalculator.new
  parsed_items.each do |item|
    cart.add_item(item[:name], item[:price], item[:type], item[:quantity], item[:imported])
  end

  puts SubscribeProject::Decorators::CartCalculatorDecorator.new(cart).receipt
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
