# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'
require 'tempfile'
require 'zlib'

describe Sysadmin::FileExtension, 'File クラス拡張' do
  context 'で非圧縮のファイルを zread した場合' do
    it "正しく読み込まれる" do
      try = "uncompressed"
      expect = "uncompressed\n"
      @uncompressed = Tempfile::new("test.txt")
      File.append_line(:file => @uncompressed.path, :str => try)

      File.zread(@uncompressed.path).should == expect
      @uncompressed.close
    end
  end

  context 'で圧縮されたファイルを zread した場合' do
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

  context 'で append_line メソッドを呼ぶと' do
    it "ファイル末尾に文字列行が追加される" do
      @testfile = Tempfile::new("test.txt")
      src      = 'hoge'
      expect   = "hoge\n"

      3.times do
        File.append_line(:file => @testfile.path, :str => src)
      end

      open(@testfile.path) { |file|
        while line = file.gets
          line.should == expect
        end
      }
      @testfile.close
    end
  end

  context 'で replace_line メソッドを呼ぶと' do
    it "ファイル内の文字列が置換される" do
      @testfile = Tempfile::new("test.txt")
      src      = 'hoge'
      try      = 'fuga'
      expect   = "fuga\n"

      3.times do
        File.append_line(:file => @testfile.path, :str => src)
      end
      File.replace_line(:file => @testfile.path, :src => src, :dst => try)

      open(@testfile.path) { |file|
        while line = file.gets
          line.should == expect
        end
      }
      @testfile.close
    end
  end

  context 'で remove_line メソッドを呼ぶと' do
    it "ファイル内の引数に適合した行が削除される" do
      @testfile = Tempfile::new("test.txt")
      src      = 'hoge'
      replace  = 'fuga'
      erase    = 'hoge'
      expect   = "fuga\n"

      3.times do
        File.append_line(:file => @testfile.path, :str => src)
      end
      File.replace_line(:file => @testfile.path, :src => src, :dst => replace)
      2.times do
        File.append_line(:file => @testfile.path, :str => src)
      end
      File.remove_line(:file => @testfile.path, :str => erase)

      open(@testfile.path) { |file|
        while line = file.gets
          line.should == expect
        end
      }
      @testfile.close
    end
  end

  context 'で new_line メソッドを呼ぶと' do
    it "文字列行のファイルが新規作成される" do
      @testfile = Tempfile::new("test.txt")
      init     = 'init'
      second   = 'second'
      expect   = "second\n"

      File.new_line(:file => @testfile.path, :str => init)
      File.new_line(:file => @testfile.path, :str => second)

      open(@testfile.path) { |file|
        while line = file.gets
          line.should == expect
        end
      }
      @testfile.close
    end
  end
end
