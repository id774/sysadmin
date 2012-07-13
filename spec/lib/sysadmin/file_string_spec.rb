# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'
require 'tempfile'

describe Sysadmin::FileString, 'ファイル内文字列操作クラスメソッド' do
  before do
    @testfile = Tempfile::new("test.txt")
  end

  context 'append メソッドを呼ぶと' do
    it "文字列行が追加される" do
      src      = 'hoge'
      expect   = "hoge\n"

      3.times do
        Sysadmin::FileString.append(@testfile.path, src)
      end

      open(@testfile.path) { |file|
        while line = file.gets
          line.should == expect
        end
      }
    end
  end

  context 'replace メソッドを呼ぶと' do
    it "引数の通りに文字列が書き換えられる" do
      src      = 'hoge'
      try      = 'fuga'
      expect   = "fuga\n"

      3.times do
        Sysadmin::FileString.append(@testfile.path, src)
      end
      Sysadmin::FileString.replace(@testfile.path, src, try)

      open(@testfile.path) { |file|
        while line = file.gets
          line.should == expect
        end
      }
    end
  end

  context 'delete メソッドを呼ぶと' do
    it "引数に適合した行が削除される" do
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
          line.should == expect
        end
      }
    end
  end

  context 'newfile メソッドを呼ぶと' do
    it "引数に与えられた文字列行のファイルが新規に作成される" do
      init     = 'init'
      second   = 'second'
      expect   = "second\n"

      Sysadmin::FileString.newfile(@testfile.path, init)
      Sysadmin::FileString.newfile(@testfile.path, second)

      open(@testfile.path) { |file|
        while line = file.gets
          line.should == expect
        end
      }
    end
  end

  after do
    @testfile.close(true)
  end
end
