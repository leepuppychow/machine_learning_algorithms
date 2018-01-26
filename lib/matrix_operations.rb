module MatrixOperations
#Ruby version 2.5 has method entrywise_product
#also note that a Matrix is immutable in Ruby, so you can't do matrix[0,1] = 5
#Enter theta as a Matrix (not Vector), because you can't do row_count or column_count on a vector in Ruby.

  def elementwise_multiply(m1, m2)
    product = Matrix.build(m1.row_count, m1.column_count) do |row, column|
      m1[row,column] * m2[row,column]
    end
  end

  def elementwise_add(m1, m2)
    product = Matrix.build(m1.row_count, m1.column_count) do |row, column|
      m1[row,column] + m2[row,column]
    end
  end

  def elementwise_subtract(m1, m2)
    product = Matrix.build(m1.row_count, m1.column_count) do |row, column|
      m1[row,column] + m2[row,column]
    end
  end

  def elementwise_divide(m1, m2)
    product = Matrix.build(m1.row_count, m1.column_count) do |row, column|
      m1[row,column] / m2[row,column]
    end
  end

end
