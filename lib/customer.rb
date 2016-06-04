class Customer
  attr_reader :name
  @@customers = []
  def initialize(options = {})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find {|customer| customer.name == name}
  end




  private

  def add_to_customers
    customers_names_arr = @@customers.map{|customer| customer.name}
    if customers_names_arr.include?(@name)
      raise DuplicateCustomerError: "Customer: #{@name} Already Exists"
    else
      @@customers << self
    end
  end
end
