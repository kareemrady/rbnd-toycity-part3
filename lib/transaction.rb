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
      begin
      raise OutOfStockError, "Error : '#{@product.title}' is out of stock"
    rescue => error
      puts error
      end

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
