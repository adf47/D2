#This tests the gold_rush.rb source code File
#This file calls all other tests files for this program
require 'simplecov'
SimpleCov.start

require_relative 'check_args_test'
require_relative 'simulator_test'
require_relative 'prospector_test'
