class Customer
  attr_reader :name
  #added a transactions array variable
  attr_accessor :transactions
  @@customers = []
  def initialize(options = {})
    @name = options[:name]
    @transactions = []
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find {|customer| customer.name == name}
  end


  def purchase(product)
    Transaction.new(self, product)

  end

#added show purchases feature
  def show_purchases
    puts "Purchases for user: #{@name}"
    puts "-"*50
    puts
    @transactions.each {|transaction| puts transaction.product.title}
    puts
    total_purchases_value = @transactions.reduce(0) {|sum, transaction| sum + transaction.product.price}
    puts "total Purchases by #{@name}: #{total_purchases_value}$"
    puts "-"*50
    puts
  end


  private

  def add_to_customers
    customers_names_arr = @@customers.map{|customer| customer.name}

    if customers_names_arr.include?(@name)
      begin
      raise DuplicateCustomerError, "DuplicateCustomerError: '#{@name}' Already Exists"
    rescue => error
      puts error
      end
    else
      @@customers << self
    end


  end
end
