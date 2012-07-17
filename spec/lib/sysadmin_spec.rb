# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Sysadmin, 'sysadmin' do
  context 'のバージョンを参照した場合' do
    it "バージョンが正しく表示される" do
      expect = '0.1.0'
      Sysadmin.const_get(:VERSION).should be_true
      Sysadmin.const_get(:VERSION).should == expect
    end
  end
end
