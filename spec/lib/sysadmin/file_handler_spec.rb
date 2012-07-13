# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'
require 'tempfile'
require 'zlib'

describe Sysadmin::FileHandler, 'File クラス拡張' do
  context 'で非圧縮のファイルを File.zread した場合' do
    it "正しく読み込まれる" do
      try = "uncompressed"
      expect = "uncompressed\n"
      @uncompressed = Tempfile::new("test.txt")
      Sysadmin::FileString.append(@uncompressed.path, try)

      File.zread(@uncompressed.path).should == expect
      @uncompressed.close
    end
  end

  context 'で圧縮されたファイルを File.zread した場合' do
    it "正しく読み込まれる" do
      try = "compressed"
      expect = "compressed\n"
      @compressed = Tempfile::new("test2.txt")
      Zlib::GzipWriter.open(@compressed.path) do |gz|
        gz.puts try
      end

      File.zread(@compressed.path).should == expect
      @compressed.close
    end
  end
end
