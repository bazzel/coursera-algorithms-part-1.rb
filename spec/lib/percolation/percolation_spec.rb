require 'spec_helper'
require 'percolation/percolation'
require 'quick_union_u_f'

describe Percolation do
  r, c = 1, 1

  let(:uf) { QuickUnionUF }
  after { r, c = 1, 1 }

  describe '#new' do
    subject { described_class.new(n, uf) }
    let(:n) { 5 }

    # TODO: Do we really want to test this?
    it 'instantiates a QuickUnionUF class with N**2+2' do
      uf.should_receive(:new).with(n**2+2)
      subject
    end
  end

  describe '#open?' do
    let(:instance) { described_class.new(n, uf) }
    subject { instance.open?(r,c) }
    let(:n) { 5 }

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
    subject        { instance.open(r, c) }
    let(:instance) { described_class.new(n, uf) }
    let(:n)        { 5 }

    it 'opens the site at the specified coordinates' do
      r, c = 1, 1
      subject
      instance.open?(r, c).should be_true
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

  describe 'full?' do
    subject        { instance.full?(r, c) }
    let(:instance) { described_class.new(n, uf) }
    let(:n)        { 5 }

    context 'sites in first row' do
      before { r = 1 }

      it 'returns true for an open site' do
        1.upto(n) do |col|
          c = col
          instance.open(r,c)
          subject.should be_true
        end
      end

      it 'returns false for a closed site' do
        1.upto(n) do |col|
          c = col
          subject.should be_false
        end
      end
    end

    context 'sites with an upstairs neighbor' do
      before { c = 1 }

      it 'returns false if neighbor is not full' do
        r = 2
        instance.open(r, c)
        subject.should be_false
      end

      it 'returns true if neighbor is full' do
        r = 2
        instance.open(1, c)
        instance.open(r, c)
        subject.should be_true
      end

      it 'returns true if neighbor becomes full later' do
        r = 2
        instance.open(r, c)
        instance.open(1, c)
        subject.should be_true
      end
    end

    context 'sites with a next door neighbor' do
      before { r, c = 2, 2 }

      it 'returns true when neighbor is full' do
        instance.open(1,1)
        instance.open(2,1)
        instance.open(r,c)

        subject.should be_true
      end

      it 'returns true when neighbor becomes full later' do
        instance.open(1,1)
        instance.open(r,c)
        instance.open(2,1)

        subject.should be_true
      end
    end

    context 'sites in last row' do
      before { r, c = n, 1 }

      it 'returns true when neighbor is full' do
        instance.open(1,c)
        instance.open(2,c)
        instance.open(3,c)
        instance.open(4,c)
        instance.open(5,c)

        subject.should be_true
      end
    end
  end

  describe '#percolates?' do
    let(:instance) { described_class.new(n, uf) }
    let(:n) { 5 }
    subject { instance.percolates?  }

    it 'returns false when no site in the bottom row is full' do
      subject.should be_false
    end

    it 'returns true when a site in the bottom row is full' do
      instance.open(1,1)
      instance.open(2,1)
      instance.open(3,1)
      instance.open(4,1)
      instance.open(5,1)

      subject.should be_true
    end

    it 'returns true when random sites become full' do
      instance.open(3,4)
      instance.open(1,2)
      instance.open(2,3)
      instance.open(5,4)
      instance.open(2,2)
      instance.open(3,3)
      instance.open(4,4)

      subject.should be_true
    end
  end
end
