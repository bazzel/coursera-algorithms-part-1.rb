require 'spec_helper'
require 'percolation/percolation'
require 'quick_union_u_f'

describe Percolation do
  r, c = 1, 1

  after { r, c = 1, 1 }

  describe '#new' do
    subject { described_class.new(n) }
    let(:n) { 5 }

    # TODO: Do we really want to test this?
    it 'instantiates a QuickUnionUF class with N**2+2' do
      QuickUnionUF.should_receive(:new).with(n**2+2)
      subject
    end
  end

  describe '#open?' do
    let(:instance) { described_class.new(n) }
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
    let(:instance) { described_class.new(n) }
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
    let(:instance) { described_class.new(n) }
    let(:n)        { 5 }

    context 'sites in first row' do
      before { c = 1 }

      it 'returns true for an open site' do
        1.upto(n) do |r|
          instance.open(r,c)
          subject.should be_true
        end
      end

      it 'returns false for a closed site' do
        1.upto(n) do |r|
          subject.should be_false
        end
      end
    end

  end
end
