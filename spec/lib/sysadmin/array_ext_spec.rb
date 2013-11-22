# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Array do
  describe '#sum' do
    context 'with no arguments' do
      subject { array.sum }

      context 'if all elements are integer' do
        let(:array) { [1, 2, 3, 4, 5] }
        it { expect(subject).to eql 15 }
      end

      context 'if array contains string' do
        let(:array) { [1, 2, 3, '4', 5] }
        it { expect(subject).to eql 15 }
      end

      context 'if array contains nil' do
        let(:array) { [1, 2, 3, nil, 5] }
        it { expect(subject).to eql 11 }
      end
    end
  end

  describe '#sumf' do
    context 'with no arguments' do
      subject { array.sumf }

      context 'if all elements are integer' do
        let(:array) { [1, 2, 3, 4, 5] }
        it { expect(subject).to eql 15.0 }
      end

      context 'if array contains string' do
        let(:array) { [1, 2, 3, '4.2', 5] }
        it { expect(subject).to eql 15.2 }
      end

      context 'if array contains string' do
        let(:array) { [1, 2, 3, nil, 5] }
        it { expect(subject).to eql 11.0 }
      end
    end
  end

  describe '#average' do
    context 'with no arguments' do
      subject { array.average }

      let(:array) { [88, 99, 77, 66, 55, 40] }
      it { expect(subject).to eql 70.83333333333333 }
    end
  end

  describe '#variance' do
    context 'with no arguments' do
      subject { array.variance }

      let(:array) { [88, 99, 77, 66, 55, 40] }
      it { expect(subject).to eql 391.8055555555556 }
    end
  end

  describe '#standard_deviation' do
    context 'with no arguments' do
      subject { array.standard_deviation }

      let(:array) { [88, 99, 77, 66, 55, 40] }
      it { expect(subject).to eql 19.79407880037754 }
    end
  end
end
