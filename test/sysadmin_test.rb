#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'test/unit'
require 'tempfile'
require 'sysadmin'

class Test_Sysadmin < Test::Unit::TestCase
  def test_version
    p Sysadmin.const_get(:VERSION)
  end
end
