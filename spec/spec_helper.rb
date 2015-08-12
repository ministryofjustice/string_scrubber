require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'string_scrubber'
require 'simplecov'

SimpleCov.start do
  add_group 'lib', 'lib'
  add_filter "/.bundle"
end
