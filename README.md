# README

## DEVELOPER:
  * Lee Chow

## RUBY VERSION:
  * Ruby 2.5.0 or 2.4.1

### UNIVARIATE LINEAR REGRESSION

#### How to Use:
  * linear = LinearRegression.new
  * linear.load_data('filename')
  * linear.univariate_linear_reg([initial_theta], learning_rate, iterations, unknown_value)

  Example (Note: initial_theta should be array with 2 elements):

    linear.univariate_linear_reg([-1,2], 0.01, 1500, 3.5)

  Output will print:
  * predicted value(y) for the unknown_value
  * linear regression model in y = mx + b format
  * cost function value for model

### MULTIVARIATE LINEAR REGRESSION USING NORMAL EQUATION

### How to Use:
  * normal = NormalEquation.new
  * normal.load_data('filename')
  * normal.normal_eqn_prediction([data])
  * normal.theta will return a matrix object with calculated theta

  Example:

    normal.normal_eqn_prediction([1650,3])
    normal.theta
