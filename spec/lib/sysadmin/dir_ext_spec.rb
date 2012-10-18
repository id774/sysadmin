# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin::DirExtension, 'Dir クラス拡張' do
  context 'で filelist メソッドを呼ぶ場合' do
    describe 'ディレクトリ名を指定すると' do
      it "ディレクトリ内のファイル一覧が返却される" do
        test_dir = File.expand_path("../../test_dir/a", File.dirname(__FILE__))
        Dir.filelist(test_dir).should have(2).items
      end
    end

    describe 'ファイル名を指定すると' do
      it "ファイル名が返却される" do
        test_dir = File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__))
        Dir.filelist(test_dir).should have(1).items
      end
    end

    describe 'サブディレクトリを true にしてディレクトリを指定すると' do
      it "サブディレクトリ内のファイルも返却される" do
        test_dir = File.expand_path("../../test_dir", File.dirname(__FILE__))
        Dir.filelist(test_dir, sub_directory = true).should have(9).items
      end
    end

    describe 'サブディレクトリを false にしてディレクトリを指定すると' do
      it "ディレクトリ内のファイル一覧が返却される (サブディレクトリは見ない)" do
        test_dir = File.expand_path("../../test_dir/a", File.dirname(__FILE__))
        Dir.filelist(test_dir, sub_directory = false).should have(2).items
      end
    end

    describe 'サブディレクトリを true にしてファイル名を指定しても' do
      it "ファイル名が返却される (サブディレクトリは見ない)" do
        test_dir = File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__))
        Dir.filelist(test_dir).should have(1).items
      end
    end

  end
end
