module SubscribeProject
  class TypeDeterminer
    TYPES_MAPPING = {
      'food'    => ->(config) { config['food_items'] },
      'medical' => ->(config) { config['medical_items'] },
      'book'    => ->(_) { ['book'] }
    }.freeze

    def self.determine(name, config)
      TYPES_MAPPING.find do |type, items_lambda|
        items = items_lambda.call(config)
        return type if items.any? { |item| name.include?(item) }
      end
      'other'
    end
  end
end
