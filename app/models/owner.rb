class Owner < Employee
  def initialize(data)
    super(data)
    @bonus = data[:bonus].to_f
  end

  def monthly_salary
  super
    if hit_company_quota? == true
      @gross_salary += 1000
    end
  end

  def hit_company_quota?
    # true if 3000000 >= 250000
    true if Sale.total_sales >= 250000
  end
end

