#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')

require 'rubygems'
require 'test/unit'
require 'tempfile'
require 'zlib'
require 'sysadmin'

class Test_FileHandler < Test::Unit::TestCase
  def test_zread_uncompressed
    @uncompressed = Tempfile::new("test.txt")
    try = "uncompressed"
    expect = "uncompressed\n"

    Sysadmin::FileString.append(@uncompressed.path, try)

    text = File.zread(@uncompressed.path)
    assert_not_nil(text)
    assert_equal(expect, text)

    @uncompressed.close
  end

  def test_zread_compressed
    try = "compressed"
    expect = "compressed\n"

    @compressed = Tempfile::new("test2.txt")
    Zlib::GzipWriter.open(@compressed.path) do |gz|
      gz.puts try
    end

    text = File.zread(@compressed.path)
    assert_not_nil(text)
    assert_equal(expect, text)

    @compressed.close
  end
end
