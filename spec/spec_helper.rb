require 'spork'
Spork.prefork do
end

Spork.each_run do
end

require 'minitest/autorun'
require 'minitest/spec'
