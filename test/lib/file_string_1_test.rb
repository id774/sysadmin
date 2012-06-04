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

  def test_append
    src      = 'hoge'
    expect   = "hoge\n"

    3.times do
      Sysadmin::FileString.append(@testfile.path, src)
    end

    open(@testfile.path) { |file|
      while line = file.gets
        assert_equal(expect, line)
      end
    }
  end

  def test_replace
    src      = 'hoge'
    try      = 'fuga'
    expect   = "fuga\n"

    3.times do
      Sysadmin::FileString.append(@testfile.path, src)
    end
    Sysadmin::FileString.replace(@testfile.path, src, try)

    open(@testfile.path) { |file|
      while line = file.gets
        assert_equal(expect, line)
      end
    }
  end

  def test_delete
    src      = 'hoge'
    replace  = 'fuga'
    erase    = 'hoge'
    expect   = "fuga\n"

    3.times do
      Sysadmin::FileString.append(@testfile.path, src)
    end
    Sysadmin::FileString.replace(@testfile.path, src, replace)
    2.times do
      Sysadmin::FileString.append(@testfile.path, src)
    end
    Sysadmin::FileString.delete(@testfile.path, erase)

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
