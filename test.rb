require "minitest/autorun"

Dir.glob("test/*_test.rb") { |f| require_relative(f) }
