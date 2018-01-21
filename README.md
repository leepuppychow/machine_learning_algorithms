1) UNIVARIATE LINEAR REGRESSION

  * Initialize:      linear = LinearRegression.new
  * Load data:       linear.load_data('filename')
  * Run algorithm:   

  linear.univariate_linear_reg(initial_theta, learning_rate, iterations, unknown_value)

  Example(note initial_theta should be array with 2 elements):

  linear.univariate_linear_reg([-1,2], 0.01, 1500, 3.5)

  Output will show:
  * predicted value(y) for the unknown_value
  * linear regression model in y = mx + b format
  * cost function for model
