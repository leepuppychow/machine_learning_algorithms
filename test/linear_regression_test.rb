require './lib/linear_regression'
require 'minitest/autorun'
require 'minitest/pride'
require 'matrix'

class LinearRegressionTest < MiniTest::Test

  def setup
    @linear = LinearRegression.new
    @linear.load_data('./data/population_profit.csv')

    @linear2 = LinearRegression.new
    @linear2.load_data('./data/straight_line.csv')
  end

  def test_can_do_element_wise_matrix_multiplication
    m1 = Matrix[[1,2,3,4]]
    m2 = Matrix[[1,2,3,4]]
    m3 = Matrix[[1,2],[3,4]]
    m4 = Matrix[[1,2],[3,4]]

    assert_equal Matrix[[1,4,9,16]], @linear.elementwise_product(m1,m2)
    assert_equal Matrix[[1,4],[9,16]], @linear.elementwise_product(m3,m4)
  end

  def test_can_load_CSV_file
    assert_instance_of Matrix, @linear.data
    assert_equal 97, @linear.data.row_count
    assert_equal 3, @linear.data.column_count
    assert_equal 97, @linear.m
    assert_instance_of Matrix, @linear.X
    assert_instance_of Vector, @linear.y
  end

  def test_will_automatically_add_column_of_1_to_X
    assert_equal 2, @linear.X.column_count
    assert_equal 97, @linear.X.row_count
    assert_equal 1, @linear.X[0,0]
    assert_equal 1, @linear.X[96,0]
  end

  def test_can_calculate_the_cost_function_for_given_theta
    theta = Matrix[[-1],[2]]
    assert_equal 54.24, @linear.cost_function(theta).round(2)
  end

  def test_can_use_gradient_descent_algorithm_to_minimize_cost_function
    theta = Matrix[[-1],[2]]
    alpha = 0.01
    iterations = 1500

    @linear.gradient_descent(theta, alpha, iterations)
    expected_theta = Matrix[[-3.709689119264011], [1.1743387084897057]]

    assert_equal expected_theta, @linear.optimized_theta
  end

  def test_can_predict_y_using_hypothesis_function_after_gradient_descent
    theta = Matrix[[-1],[2]]
    alpha = 0.01
    iterations = 1500

    @linear.gradient_descent(theta, alpha, iterations)

    assert_equal 0.4004963604499583, @linear.predict(3.5)
    assert_equal 4.510681840163928, @linear.predict(7)
  end

  def test_run_program
    assert_equal 0.4004963604499583, @linear.univariate_linear_reg([-1,2], 0.01, 1500, 3.5)
    assert_equal 4.510681840163928, @linear.univariate_linear_reg([-1,2], 0.01, 1500, 7)
    assert_equal 15.0, @linear2.univariate_linear_reg([0,0], 0.01, 1500, 15).round(1)
  end


end
