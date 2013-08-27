require 'spec_helper'
require 'percolation/percolation'
require 'quick_union_u_f'

describe Percolation do
  describe '#new' do
    subject { described_class.new(n) }
    let(:n) { 5 }

    # TODO: Do we really want to test this?
    it 'instantiates a QuickUnionUF class with N+1' do
      QuickUnionUF.should_receive(:new).with(n+1)
      subject
    end
  end

  describe '#open?' do
    i, j = nil, nil
    let(:instance) { described_class.new(n) }
    subject { instance.open?(i,j) }
    let(:n) { 5 }

    after do
      i, j = 1, 1
    end

    it 'returns false when site is not opened' do
      i, j = 1, 1
      subject.should be_false
    end

    context 'raises an IndexError' do
      it 'passed 0 or less for i' do
        i = 0
        expect { subject }.to raise_error(IndexError)
      end
      it 'passed 0 or less for j' do
        j = 0
        expect { subject }.to raise_error(IndexError)
      end
      it 'passed value greater than n for i' do
        i = n+1
        expect { subject }.to raise_error(IndexError)
      end
      it 'passed value greater than n for j' do
        j = n+1
        expect { subject }.to raise_error(IndexError)
      end
    end

  end

end
