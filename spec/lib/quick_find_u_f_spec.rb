require 'spec_helper'
require 'quick_find_u_f'

describe QuickFindUF do
  describe '#initialize' do
    subject { described_class.new(10) }

    it 'accepts a integer for the number of sites' do
      expect { subject }.not_to raise_error
    end
  end

  describe '#connected?' do
    subject { described_class.new(10) }

    it 'has no connected sites on initialization' do
      subject.connected?(0,1).should be_false
      subject.connected?(3,5).should be_false
    end
  end

  describe '#union' do
    subject { described_class.new(10) }

    it 'connects 2 sites' do
      subject.union(0,1)
      subject.connected?(0,1).should be_true
    end
  end

end