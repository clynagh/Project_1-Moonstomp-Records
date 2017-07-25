require('minitest/autorun')
require('pry-byebug')
require_relative('../models/stock.rb')

class TestStock < MiniTest::Test

  def setup
    @stock = Stock.new("overstocked")
  end

   def test_percentage_of_stock()
    # @stock.percentage_of_stock()
    #  stock =  ((15 / 10).to_f * 100).round(2)
    # binding.pry
    # assert_equal("Overstocked", @stock.percentage_of_stock )
   end
end