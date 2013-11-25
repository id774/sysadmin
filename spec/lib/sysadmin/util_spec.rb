# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin::Util do
  describe '#create_multi_dimensional_hash' do
    context 'with no arguments' do
      subject {
        h = Sysadmin::Util.create_multi_dimensional_hash
        h["a"]["b"]["c"]["d"] = 10
      }

      it 'should be returned multi dimensional hash' do
        expect(subject).to eq 10
      end
    end
  end
end
