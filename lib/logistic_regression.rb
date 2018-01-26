require 'csv'
require 'matrix'
require './lib/equations'
require './lib/feature_scaling'

class LogisticRegression
  include Equations
  include FeatureScaling

end
