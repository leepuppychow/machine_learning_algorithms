# README

## DEVELOPER:
  * Lee Chow

## RUBY VERSION:
  * Ruby 2.5.0 or 2.4.1

### UNIVARIATE LINEAR REGRESSION

#### Steps:
  * 1) linear = LinearRegression.new
  * 2) linear.load_data('filename')
  * 3) linear.univariate_linear_reg([initial_theta], learning_rate, iterations, unknown_value)

  Example (Note: initial_theta should be array with 2 elements):

  linear.univariate_linear_reg([-1,2], 0.01, 1500, 3.5)

  Output will show:
  
  * predicted value(y) for the unknown_value
  * linear regression model in y = mx + b format
  * cost function for model
