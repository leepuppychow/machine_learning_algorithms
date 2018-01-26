require './lib/logistic_regression'
require 'minitest/autorun'
require 'minitest/pride'
require 'matrix'

class FeatureScalingTest < MiniTest::Test

  def test_can_normalize_data_for_an_array_of_values
    data1 = [1000,1050,1020,1100,2000,1650]
    data2 = [5,7,23,17,19,11]
    log = LogisticRegression.new
    expected1 = [-0.79, -0.659, -0.738, -0.529, 1.817, 0.904]
    expected2 = [-1.234, -0.926, 1.543, 0.617, 0.926, -0.309]

    assert_equal expected1, log.mean_normalization(data1)
    assert_equal expected2, log.mean_normalization(data2)
  end

  def test_can_normalize_data_for_a_matrix
    matrix = Matrix[[1000,1050,1020,1100,2000,1650],
                    [5,7,23,17,19,11]].transpose
    log = LogisticRegression.new
    expected = Matrix[[-0.79, -0.659, -0.738, -0.529, 1.817, 0.904],
                    [-1.234, -0.926, 1.543, 0.617, 0.926, -0.309]].transpose

    assert_equal expected, log.mean_normalization_matrix(matrix)
  end

end
