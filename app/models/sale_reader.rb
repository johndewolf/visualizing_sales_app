class SaleReader
require 'CSV'
  attr_reader :sales

  def initialize
    @sales = []
  end

  def import_sales
    CSV.foreach('db/sales_data.csv', headers: true) do |row|
      last_name = row['last_name']
      gross_sale_value = row['gross_sale_value'].to_i
      @sales << Sale.new(last_name, gross_sale_value)
    end
    @sales
  end


end
