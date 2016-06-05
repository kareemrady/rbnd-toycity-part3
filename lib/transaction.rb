class Transaction
  attr_reader :id, :customer, :product, :type
  @@id = 1
  @@transactions = []
  def initialize(customer, product, refund = false)
    @customer = customer
    @product = product
    @refund = refund

    #defaults to new purchase if nothing is identified

    if @refund
      @type = :refund
    else
      @type = :purchase
    end
    add_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find{|transaction| transaction.id == id}
  end

  def refund_customer
    @customer.transactions.delete(self)
    

  end

  #Add show transactions method to show all transactions made and their types

  def self.show_transactions
    puts "Transactions List:"
    puts "-"*50
    puts
    @@transactions.each do |transaction|
      puts "ID: #{transaction.id}"
      puts "Customer Name: #{transaction.customer.name}"
      puts "Product Name: #{transaction.product.title}"
      puts "Type of Transaction: #{transaction.type}"
    end
  end





  private

  # modified add_tranaction to include whether it was a refund or purchase
  def add_transaction

    if(@type == :purchase)
      if(@product.stock == 0)
        begin
        raise OutOfStockError, "OutOfStockError: '#{@product.title}' is out of stock"
      rescue => error
        puts error
        end

      else
        modifiy_transactions
        edit_stock({new_purchase: true })
        @customer.transactions << self

      end
    else
      modifiy_transactions
      edit_stock({return_purchase: true})

    end
  end


  def modifiy_transactions
    @id = @@id
    @@id +=1
    @@transactions << self
  end

  def edit_stock(options = {})
    purchase_operation = options[:new_purchase]
    return_operation = options[:return_purchase]
    if return_operation
      @product.stock += 1
    else
      @product.stock -=1
    end
  end




end
