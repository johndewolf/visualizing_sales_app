class Sale
  attr_reader :last_name, :gross_sale_value, :commission_earned

  @@sales = []

  def initialize(last_name, gross_sale_value)
    @last_name = last_name
    @gross_sale_value = gross_sale_value
    @@sales << @gross_sale_value
    @commission_earned = 0
  end

  def self.total_sales
    @@sales.inject(:+)
  end

  def calculate_commission
    employees = EmployeeReader.new.import_file
    employees.each do |employee|
      if employee.last_name == @last_name && employee.job == 'Commission'
        @commission_earned += employee.commission * @gross_sale_value
      end
    end
  end
end
