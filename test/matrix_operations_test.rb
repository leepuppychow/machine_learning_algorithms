require './lib/linear_regression'
require 'minitest/autorun'
require 'minitest/pride'
require 'matrix'

class MatrixOperationsTest < MiniTest::Test

  def test_it_can_add_column_of_ones_to_beginning_of_matrix
    matrix = Matrix[[3,5],[4,6],[9,7]]
    lin = LinearRegression.new

    expected = Matrix[[1,3,5],[1,4,6],[1,9,7]]

    assert_equal expected, lin.add_column_of_ones(matrix)
  end

end
