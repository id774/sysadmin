# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Time do
  describe '#strict_parse' do
    context 'with valid date' do
      subject { Time.strict_parse("2012/09/27 11:45:00") }

      let(:expected) { Time.parse("2012/09/27 11:45:00") }

      it 'should be returned valid date' do
        expect(subject).to eql expected
      end
    end

    context 'with invalid date' do
      subject { Time.strict_parse("hoge") }

      it 'should be returned nil' do
        expect(subject).to be_nil
      end
    end
  end
end
