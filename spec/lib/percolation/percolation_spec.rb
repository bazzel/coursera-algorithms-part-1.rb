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
    r, c = nil, nil
    let(:instance) { described_class.new(n) }
    subject { instance.open?(r,c) }
    let(:n) { 5 }

    after do
      r, c = 1, 1
    end

    it 'returns false when site is not opened' do
      r, c = 1, 1
      subject.should be_false
    end

    context 'raises an IndexError' do
      it 'passed 0 or less for r' do
        r = 0
        expect { subject }.to raise_error(IndexError)
      end
      it 'passed 0 or less for c' do
        c = 0
        expect { subject }.to raise_error(IndexError)
      end
      it 'passed value greater than n for r' do
        r = n+1
        expect { subject }.to raise_error(IndexError)
      end
      it 'passed value greater than n for c' do
        c = n+1
        expect { subject }.to raise_error(IndexError)
      end
    end

  end

  describe '#open' do
    r, c = nil, nil
    subject { described_class.new(n) }
    let(:n) { 5 }

    after do
      r, c = 1, 1
    end

    it 'opens the site at the specified coordinates' do
      r, c = 1, 1
      subject.open(r,c)
      subject.open?(r,c).should be_true
    end
  end

end
