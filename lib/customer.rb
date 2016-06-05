class Customer
  attr_reader :name
  #added a purchases array variable
  attr_accessor :purchases
  @@customers = []
  def initialize(options = {})
    @name = options[:name]
    @purchases = []
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
    puts "-"*30
    puts
    @purchases.each {|product| puts product.title}
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
