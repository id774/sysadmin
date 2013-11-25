# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Array do
  describe '#sum' do
    context 'with no arguments' do
      subject { array.sum }

      context 'if all elements are integer' do
        let(:array) { [1, 2, 3, 4, 5] }
        it 'should return integer summary of elements' do
          expect(subject).to eq 15
        end
      end

      context 'if array contains string' do
        let(:array) { [1, 2, 3, '4', 5] }
        it 'should return integer summary of elements' do
          expect(subject).to eq 15
        end
      end

      context 'if array contains nil' do
        let(:array) { [1, 2, 3, nil, 5] }
        it 'should return integer summary of elements' do
          expect(subject).to eq 11
        end
      end
    end
  end

  describe '#sumf' do
    context 'with no arguments' do
      subject { array.sumf }

      context 'if all elements are integer' do
        let(:array) { [1, 2, 3, 4, 5] }
        it 'should return float summary of elements' do
          expect(subject).to eq 15.0
        end
      end

      context 'if array contains string' do
        let(:array) { [1, 2, 3, '4.2', 5] }
        it 'should return float summary of elements' do
          expect(subject).to eq 15.2
        end
      end

      context 'if array contains string' do
        let(:array) { [1, 2, 3, nil, 5] }
        it 'should return float summary of elements' do
          expect(subject).to eq 11.0
        end
      end
    end
  end

  describe '#average' do
    context 'with no arguments' do
      subject { array.average }

      let(:array) { [8, 9, 7, 6, 5, 4] }
      it 'should return average of array' do
        expect(subject).to eq 6.5
      end
    end
  end

  describe '#variance' do
    context 'with no arguments' do
      subject { array.variance }

      let(:array) { [8, 9, 7, 6, 5, 4] }
      it 'should return variance of array' do
        expect(subject).to eq 2.9166666666666665
      end
    end
  end

  describe '#standard_deviation' do
    context 'with no arguments' do
      subject { array.standard_deviation }

      let(:array) { [8, 9, 7, 6, 5, 4] }
      it 'should return standard deviation of array' do
        expect(subject).to eq 1.707825127659933
      end
    end
  end
end
