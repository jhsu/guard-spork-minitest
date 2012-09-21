require 'bundler'
Bundler.require
$:.unshift File.expand_path(File.join(File.dirname(__FILE__), "lib"))

# This tells spork to look in spec
# comment out to use minitest/unit
require 'minitest/spec'
