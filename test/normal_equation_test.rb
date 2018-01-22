require './lib/normal_equation'
require 'minitest/autorun'
require 'minitest/pride'
require 'matrix'

class NormalEquationTest < MiniTest::Test

  def setup
    @normal = NormalEquation.new
    @normal.load_data("./data/house_price_multivariate.csv")
  end

  def test_it_can_load_data
    assert_instance_of Matrix, @normal.data
    assert_instance_of Matrix, @normal.X
    assert_instance_of Matrix, @normal.y
    assert_equal 47, @normal.X.row_count
    assert_equal 47, @normal.y.row_count
  end

  def test_it_can_add_column_of_1_to_X
    assert_equal 3, @normal.X.column_count
    assert_equal 1, @normal.X[0,0]
    assert_equal 1, @normal.X[46,0]
  end

  def test_it_can_get_predicted_theta_using_normal_equation
    expected = Matrix[[89597.90954279766], [139.2106740176255], [-8738.019112327795]]
    assert_equal expected, @normal.theta
  end

  def test_can_convert_array_input_into_matrix_with_added_1_in_first_row
    assert_equal Matrix[[1],[1],[2],[3]], @normal.input_as_matrix([1,2,3])
  end

  def test_can_make_prediction_with_calculated_theta
    #predict house price for a 1650 sq-ft, 3 bedroom house
    assert_equal 293081.46, @normal.normal_eqn_prediction([1650, 3]).round(2)
    assert_equal 463539.84, @normal.normal_eqn_prediction([3000, 5]).round(2)
  end

end
