class Transaction
  attr_reader :id, :customer, :product
  @@id = 1
  @@transactions = []
  def initialize(customer, product)
    @id = @@id
    @@id +=1
    @customer = customer
    @product = product
    @@transactions << self
    edit_stock
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find{|transaction| transaction.id == id}
  end








  private

  def edit_stock
    @product.stock -= 1
  end
end
