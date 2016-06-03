class Product
  attr_reader :title
  @@products = []
  def initialize(options = {})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
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
