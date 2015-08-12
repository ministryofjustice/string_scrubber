$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'string_scrubber'

if ENV['CIRCLE_ARTIFACTS']
  require 'simplecov'
  dir = File.join("..", "..", "..", ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
end
