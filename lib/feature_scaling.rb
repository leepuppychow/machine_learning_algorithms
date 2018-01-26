require 'pry'

module FeatureScaling

  def mean_normalization_matrix(matrix, decimals = 3)
    normalized_columns = []
    matrix.column_count.times do |i|
      normalized_columns << mean_normalization(matrix.column(i), decimals)
    end
    Matrix.columns(normalized_columns)
  end

  def mean_normalization(array, decimals = 3)
    average = average(array)
    std = standard_deviation(array)
    array.map {|value| ((value-average)/std).round(decimals) }
  end

  def average(data)
    data.sum / data.count
  end

  def standard_deviation(data)
    #population standard deviation
    Math.sqrt(data.map {|value| (value - average(data))**2 }.sum / data.count)
  end

  def range(data)
    data.max - data.min
  end

end
