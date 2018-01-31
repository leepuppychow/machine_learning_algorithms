require './lib/logistic_regression'
require 'minitest/autorun'
require 'minitest/pride'
require 'matrix'

class LogisticRegressionTest < MiniTest::Test

  def setup
    @log = LogisticRegression.new
    @log.load_data("./data/logistic_regression_predicting_admission.csv")
  end

  def test_can_get_sigmoid_of_single_value
    value1 = 900
    value2 = -900
    value3 = 0

    assert_equal 1.0, @log.sigmoid(value1)
    assert_equal 0.0, @log.sigmoid(value2)
    assert_equal 0.5, @log.sigmoid(value3)
  end

  def test_can_get_sigmoid_of_entire_matrix
    matrix = Matrix[[900,-900], [0,0]]
    expected = Matrix[[1.0, 0.0], [0.5,0.5]]

    vector = Vector[900,-900,0]

    assert_equal expected, @log.sigmoid_matrix(matrix)
    assert_equal Vector[1.0,0,0.5], @log.sigmoid_matrix(vector)
  end

  def test_it_can_load_data
    assert_equal 100, @log.m
    assert_equal 100, @log.X.row_count
    assert_equal 3, @log.X.column_count
  end

  def test_can_get_hypothesis_function
    theta = Matrix[[-1],[2],[3]]
    result = @log.hypothesis(theta)
    assert_instance_of Matrix, result
    assert_equal 1.0, result.element(0,0)
    assert_equal 1.0, result.element(99,0)
    assert_equal 100, result.row_count
  end

  def test_can_calculate_cost_for_a_hypothesis
    theta = Matrix[[0],[0],[0]]

    assert_equal 0.693, @log.cost_function(theta).round(3)
  end

  def test_can_use_gradient_descent_to_find_optimized_theta
    theta = Matrix[[0.5],[-0.62],[3]]
    iterations = 1000
    alpha = 0.01

    @log.gradient_descent(theta, alpha, iterations)

    assert_equal 0, @log.optimized_theta
  end


end
