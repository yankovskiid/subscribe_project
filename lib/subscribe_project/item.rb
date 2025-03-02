module SubscribeProject
  class Item
    attr_reader :name, :price, :type, :quantity, :imported

    def initialize(name:, price:, type:, quantity:, imported: false)
      @name = name
      @price = price
      @type = type
      @quantity = quantity
      @imported = imported
    end
  end
end
