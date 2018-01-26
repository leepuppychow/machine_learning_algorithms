require './lib/logistic_regression'
require 'minitest/autorun'
require 'minitest/pride'
require 'matrix'

class LogisticRegressionTest < MiniTest::Test

  def test_can_get_sigmoid_of_single_value
    value1 = 900
    value2 = -900
    value3 = 0
    log = LogisticRegression.new

    assert_equal 1.0, log.sigmoid(value1)
    assert_equal 0.0, log.sigmoid(value2)
    assert_equal 0.5, log.sigmoid(value3)
  end

  def test_can_get_sigmoid_of_entire_matrix
    matrix = Matrix[[900,-900], [0,0]]
    log = LogisticRegression.new
    expected = Matrix[[1.0, 0.0], [0.5,0.5]]

    vector = Vector[900,-900,0]

    assert_equal expected, log.sigmoid_matrix(matrix)
    assert_equal Vector[1.0,0,0.5], log.sigmoid_matrix(vector)
  end

end
