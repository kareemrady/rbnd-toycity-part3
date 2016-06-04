class Transaction
  attr_reader :id, :customer, :product
  @@id = 1
  @@transactions = []
  def initialize(customer, product)
    @customer = customer
    @product = product
    add_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find{|transaction| transaction.id == id}
  end








  private

  def add_transaction
    if(@product.stock == 0)
      raise OutOfStockError: "#{@product.title} is out of stock"
    else
      @id = @@id
      @@id +=1
      @@transactions << self
      edit_stock
    end
  end

  def edit_stock
    @product.stock -= 1
  end
end
