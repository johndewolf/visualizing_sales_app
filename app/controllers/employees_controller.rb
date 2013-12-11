require 'pry'
class EmployeesController < ApplicationController
  def index
    @employees = EmployeeReader.new.import_file
    @sales = SaleReader.new.import_sales
  end
end
