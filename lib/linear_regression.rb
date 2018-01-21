require 'csv'
require 'matrix'
require './lib/matrix_operations'
require 'pry'

class LinearRegression
#this will do univariate linear regression using gradient descent
#cost_function is the mean squared error

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
    #the unshift here adds the column of one for x(0)
    @data = Matrix.rows(CSV.readlines(file).map {|row| row.unshift(1.0)})
    @data = change_all_data_to_float
    @m = @data.row_count
    @X = @data.minor(0..@m, 0..1)
    @y = @data.column(2)
  end

  def change_all_data_to_float
    @data.map{|element| element.to_f}
  end

  def hypothesis(theta)
    @X * theta
  end

  def cost_function(theta)
    (hypothesis(theta) - @y).map{|element| element**2}.sum / (2*@m)
  end

  def gradient_descent(theta, alpha, iterations)
    temp_theta0 = 0
    temp_theta1 = 0
    iterations.times do
#had do do @X.minor(0..@m,0..0) instead of @X.column(0) becuase the latter is a Vector
#cannot do row_count on Vector, which is called in elementwise_product
      temp_theta0 = theta[0,0] - (alpha/@m) * (elementwise_product((hypothesis(theta)-@y), @X.minor(0..@m,0..0)).sum)
      temp_theta1 = theta[1,0] - (alpha/@m) * (elementwise_product((hypothesis(theta)-@y), @X.minor(0..@m,1..1)).sum)
#this does the simultaneous update for all elements of theta
      theta = Matrix[[temp_theta0],[temp_theta1]]
    end
    @optimized_theta = theta
  end

  def predict(value)
    features = Matrix[[1,value]]
    puts "For value: #{value}:"
    puts "Predicted output is: #{(features * @optimized_theta)[0,0]}"
    puts "Model is: y = #{optimized_theta[0,0]}x(0) + #{optimized_theta[1,0]}x(1)"
    puts "With cost function of: #{cost_function(@optimized_theta)}"
    (features * @optimized_theta)[0,0]
  end

  def univariate_linear_reg(init_theta, learning_rate, iterations, unknown)
    theta = Matrix[[init_theta[0]], [init_theta[1]]]
    gradient_descent(theta, learning_rate, iterations)
    predict(unknown)
  end

end
