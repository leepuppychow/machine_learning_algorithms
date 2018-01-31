module Equations

  def sigmoid(value)
    1 / (1 + Math.exp(-value))
  end

  def sigmoid_matrix(matrix)
    matrix.map {|element| sigmoid(element)}
  end

  def log_matrix(matrix)
    matrix.map {|element| Math.log(element)}
  end

end
