module MatrixOperations
#Ruby version 2.5 has method entrywise_product
#also note that a Matrix is immutable in Ruby, so you can't do matrix[0,1] = 5
#Enter theta as a Matrix (not Vector), because you can't do row_count or column_count on a vector in Ruby.

  def add_column_of_ones(matrix)
    Matrix.rows(matrix.to_a.map {|row| row.unshift(1.0)})
  end

  def elementwise_multiply(m1, m2)
    product = Matrix.build(m1.row_count, m1.column_count) do |row, column|
      m1[row,column] * m2[row,column]
    end
  end

  def elementwise_divide(m1, m2)
    product = Matrix.build(m1.row_count, m1.column_count) do |row, column|
      m1[row,column] / m2[row,column]
    end
  end

  def change_all_data_to_float(matrix)
    matrix.map{|element| element.to_f}
  end

  def ones(row,column)
    Matrix.build(row,column) {1}
  end

  def zeros(row,column)
    Matrix.build(row,column) {0}
  end

end
