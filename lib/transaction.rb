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
      raise OutOfStockError, "OutOfStockError: '#{@product.title}' is out of stock"
    rescue => error
      puts error
      end

    else
      @id = @@id
      @@id +=1
      @@transactions << self
      edit_stock({new_purchase: true })
      @customer.purchases << @product

    end
  end

  def edit_stock(options = {})
    purchase_operation = options[:new_purchase]
    return_operation = options[:return_purchase]
    if return_operation.nil? && purchase_operation
      @product.stock -= 1
    else
      @product.stock +=1
    end
  end




end
