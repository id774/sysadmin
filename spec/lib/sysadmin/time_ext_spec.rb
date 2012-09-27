# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin::TimeExtension, 'Time クラス拡張' do
  context 'で strict_parse メソッドを呼ぶ場合' do
    describe '有効な日付を指定すると' do
      it "日付が返却される" do
        expect = Time.parse("2012/09/27 11:45:00")
        Time.strict_parse("2012/09/27 11:45:00").should == expect
      end
    end

    describe '無効な日付を指定すると' do
      it "nil が返却される" do
        Time.strict_parse("hoge").should be_nil
      end
    end
  end
end
