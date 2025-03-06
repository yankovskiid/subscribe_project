module SubscribeProject
  class TypeDeterminer
    def self.determine(name, config)
      config['product_types'].each do |type, items|
        return type if items.any? { |item| name.include?(item) }
      end
      'other'
    end
  end
end
