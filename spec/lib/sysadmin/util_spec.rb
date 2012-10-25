# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin::Util do
  context 'で create_multi_dimensional_hash メソッドを呼ぶ場合' do
    describe '引数を付けずに呼ぶと' do
      it "多次元ハッシュが返る" do
        h = Sysadmin::Util.create_multi_dimensional_hash
        h["a"]["b"]["c"]["d"] = 10
        h["a"]["b"]["c"]["e"] = 15
        h["a"]["b"]["c"]["d"].should == 10
        h["a"]["b"]["c"]["e"].should == 15
      end
    end
  end
end
