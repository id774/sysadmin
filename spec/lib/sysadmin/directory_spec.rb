# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin::Directory, 'Directory クラス' do
  context 'で map メソッドを呼ぶ場合' do
    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(9).items
      end
    end

    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir/a", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(4).items
      end
    end

    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir/a/g", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(2).item
      end
    end

    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir/b", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).map{|f|f}.should have(2).item
      end
    end

    describe 'ディレクトリ名を指定し grep すると' do
      it "ディレクトリ内の grep に適合したファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).grep(/\.txt/).should have(9).item
      end
    end

    describe 'ディレクトリ名を指定し grep すると' do
      it "ディレクトリ内の grep に適合したファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).grep(/d\.txt/).should have(1).items
      end
    end

    describe 'ディレクトリ名を指定し grep して take すると' do
      it "ディレクトリ内の grep に適合し take した数だけファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Sysadmin::Directory.new(test_dir).grep(/\.txt/).take(3).should have(3).items
      end
    end

  end
end
