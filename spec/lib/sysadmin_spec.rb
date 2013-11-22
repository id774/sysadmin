# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Sysadmin do
  context "VERSION" do
    subject { Sysadmin::VERSION }

    it { expect(subject).to eql "0.1.5" }
  end
end
