class SalesController < ApplicationController
  def index
    @sales = SaleReader.new.import_sales
    @employees = EmployeeReader.new.import_file
  end
end
