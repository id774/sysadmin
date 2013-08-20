# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin, 'Array クラス拡張' do
  context 'で average メソッドを呼ぶ場合' do
    it "平均が返却される" do
      a = [88, 99, 77, 66, 55, 40]
      a.average.should == 70.83333333333333
    end
  end

  context 'で variance メソッドを呼ぶ場合' do
    it "分散が返却される" do
      a = [88, 99, 77, 66, 55, 40]
      a.variance.should == 391.8055555555556
    end
  end

  context 'で standard_devitation メソッドを呼ぶ場合' do
    it "標準偏差が返却される" do
      a = [88, 99, 77, 66, 55, 40]
      a.standard_devitation.should == 19.79407880037754
    end
  end
end
