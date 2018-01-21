DATA LOADING:

1. Load from CSV --> data
2. Get X (features) from data and store in a Matrix object
3. Get y (labels) from data and store in Vector or Matrix
4. Find m (size of dataset)


LINEAR REGRESSION (univariate):

1. Add column of 1's to X
2. Theta (generate random, or get from user)
3. Define Cost Function (mean squared error)
    a. (X * theta) - y
    b. Square this difference
    c. Sum all of them
    d. divide by 2m

    J = sum(((X*theta)-y).^2) / (2*m);

4. Define Gradient Descent Algorithm
    a. Take in X, y, theta
    b. Get alpha and number_of_iterations from user
    c. Run algorithm:

number_of_iterations.times do
  temp_theta1 = theta(1) - (alpha/m * sum((X*theta - y) .* X(:,1)));
  temp_theta2 = theta(2) - (alpha/m * sum((X*theta - y) .* X(:,2)));
  theta(1) = temp_theta1;
  theta(2) = temp_theta2;
end

  5. Now take optimized theta vector and display hypothesis equation for user:
    a. h(x) = theta(0) + theta(1)x1 + ... + theta(n)xn

  6. Allow user to enter new data point, and make prediction using hypothesis function 
