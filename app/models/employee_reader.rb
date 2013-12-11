require 'csv'
class EmployeeReader
  attr_reader :employees

  def initialize
    @employees = []
  end

  def import_file
    CSV.foreach('db/employee_info.csv', headers:true, header_converters: :symbol) do |row|
      @employees << create_employee(row.to_hash)
    end
    @employees
  end

  def create_employee(row)
    job = row[:job]

    if job == 'Quota'
      QuotaSalesPerson.new(row)
    elsif job == 'Commission'
      CommissionSalesPerson.new(row)
    elsif job == 'Owner'
      Owner.new(row)
    else
      Employee.new(row)
    end
  end

end
