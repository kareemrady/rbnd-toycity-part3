class Product
  attr_reader :title, :price, :stock
  attr_writer :stock
  @@products = []
  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.find {|product| product.title == title}
  end

  def in_stock?
    bool_in_stock = false
    bool_in_stock = true if @stock > 0
    bool_in_stock

  end

  def self.in_stock
    @@products.find_all {|product| product.in_stock? }
  end




  private

  def add_to_products
  if @@products.reduce(false) {|bool_value, product| bool_value || product.title == @title}
    raise ProductDuplicateError: "#{@title} already exists"
  else
    @@products << self
  end
end



end
