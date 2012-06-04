#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')

require 'rubygems'
require 'test/unit'
require 'tempfile'
require 'sysadmin'

class Test_FileString < Test::Unit::TestCase
  def setup
    @testfile = Tempfile::new("test.txt")
  end

  def test_newfile
    init     = 'init'
    second   = 'second'
    expect   = "second\n"

    Sysadmin::FileString.newfile(@testfile.path, init)
    Sysadmin::FileString.newfile(@testfile.path, second)

    open(@testfile.path) { |file|
      while line = file.gets
        assert_equal(expect, line)
      end
    }
  end

  def teardown
    @testfile.close(true)
  end
end
