require 'csv'
require 'matrix'
require './lib/equations'
require './lib/feature_scaling'
require './lib/matrix_operations'

class LogisticRegression
  include Equations
  include FeatureScaling
  include MatrixOperations

  attr_reader :data,
              :X,
              :y,
              :m,
              :theta,
              :optimized_theta

  def initialize
    @data = Matrix[]
    @X = Matrix[]
    @y = Matrix[]
    @m = 0
    @theta = Matrix[]
    @optimized_theta = Matrix[]
  end

  def load_data(file)
    @data = Matrix.rows(CSV.readlines(file))
    process_data
  end

  def process_data
    @data = change_all_data_to_float(@data)
    columns = @data.column_count
    @m = @data.row_count
    @X = @data.minor(0..@m, 0..columns-2)
    @y = @data.minor(0..@m, (columns-1)..(columns - 1))
    @X = add_column_of_ones(@X)
  end

  def hypothesis(theta)
    sigmoid_matrix(@X * theta)
  end

  def cost_function(theta)
    first_term = (-@y.transpose * log_matrix(hypothesis(theta)))
    second_term = (ones(@m,1) - @y).transpose * log_matrix(ones(@m,1) - hypothesis(theta))
    (first_term - second_term).first / @m
  end

  def gradient_descent(theta, alpha, iterations)
    temp_theta0 = 0
    temp_theta1 = 0
    temp_theta2 = 0
    iterations.times do
#had do do @X.minor(0..@m,0..0) instead of @X.column(0) because the latter is a Vector
#cannot do row_count on Vector, which is called in elementwise_multiply
      temp_theta0 = theta[0,0] - (alpha/@m) * (elementwise_multiply((hypothesis(theta)-@y), @X.minor(0..@m,0..0)).sum)
      temp_theta1 = theta[1,0] - (alpha/@m) * (elementwise_multiply((hypothesis(theta)-@y), @X.minor(0..@m,1..1)).sum)
      temp_theta2 = theta[2,0] - (alpha/@m) * (elementwise_multiply((hypothesis(theta)-@y), @X.minor(0..@m,2..2)).sum)
#this does the simultaneous update for all elements of theta
      theta = Matrix[[temp_theta0],[temp_theta1],[temp_theta2]]
    end
    @optimized_theta = theta

    binding.pry
  end

end
