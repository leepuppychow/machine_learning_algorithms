require 'matrix'
require 'csv'

class NormalEquation

  attr_reader :data, :X, :y

  def initialize
    @data = Matrix[]
    @X = Matrix[]
    @y = Matrix[]
    @m = 0
  end

  def load_data(file)
    @data = Matrix.rows(CSV.readlines(file).map {|row| row.unshift(1.0)})
    process_data
  end

  def process_data
    @data = change_all_data_to_floats
    @m = @data.row_count
    columns = @data.column_count
    @X = @data.minor(0..@m, 0..columns-2)
    @y = @data.minor(0..@m, columns-1..columns-1)
  end

  def change_all_data_to_floats
    @data.map{|element| element.to_f}
  end

  def theta
  # Derive theta analytically using normal equation
    (@X.transpose * @X).inverse * @X.transpose * @y
  end

  def normal_eqn_prediction(unknown)
    (theta.transpose * input_as_matrix(unknown))[0,0]
  end

  def input_as_matrix(unknown)
    Matrix.rows(unknown.unshift(1).map {|element| [element]})
  end

end
