#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'test/unit'
require 'tempfile'
require 'sysadmin'

class Test_Sysadmin < Test::Unit::TestCase
  def test_version
    expect = '0.0.3'
    version = Sysadmin.const_get(:VERSION)
    p "sysadmin #{version}"
    assert_equal(expect, version)
  end
end
