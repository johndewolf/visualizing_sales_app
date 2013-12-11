class Employee
  attr_reader :first_name, :gross_salary, :last_name, :job, :base_salary, :commission, :amount_sold

  def initialize(data)
    @job = data[:job]
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @base_salary = data[:base_salary].to_f
    @amount_sold = 0
  end

  def monthly_salary
    @gross_salary = (@base_salary / 12).round(2)
  end

  def net_pay
    (@gross_salary * 0.7).round(2)
  end

  def add_commission
    sales = SaleReader.new.import_sales
    sales.each do |sale|
      if @last_name == sale.last_name
      @amount_sold += sale.gross_sale_value
      end
    end
  end



end
