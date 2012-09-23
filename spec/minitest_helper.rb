require File.expand_path(File.join(File.dirname(__FILE__),"../boot.rb"))

Spork.prefork do
end

Spork.each_run do
end

require 'minitest/autorun'
require 'minitest/spec'
# require 'minitest/pride'
# require 'minitest/emoji'
