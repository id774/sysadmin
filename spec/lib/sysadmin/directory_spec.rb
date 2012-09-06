# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin::Directory, 'Directory クラス' do
  context 'で map メソッドを呼ぶ場合' do
    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(7).items
      end
    end

    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir/dir2", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(2).items
      end
    end

    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir/dir3", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(1).item
      end
    end

    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir/dir6", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(1).item
      end
    end

    describe 'ディレクトリ名を指定し grep すると' do
      it "ディレクトリ内の grep に適合したファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).grep(/\.file7$/).should have(1).item
      end
    end

    describe 'ディレクトリ名を指定し grep すると' do
      it "ディレクトリ内の grep に適合したファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).grep(/\.file/).should have(3).items
      end
    end

    describe 'ディレクトリ名を指定し grep して take すると' do
      it "ディレクトリ内の grep に適合し take した数だけファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).grep(/\.file/).take(2).should have(2).items
      end
    end

  end
end
