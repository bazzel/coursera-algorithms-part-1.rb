require 'spec_helper'
require 'union_find'

describe UnionFind do
  describe '#initialize' do
    it 'accepts a integer for the number of sites' do
      expect do
        described_class.new(10)
      end.not_to raise_error
    end
  end

  describe '#connected?' do
    it 'is not connected on initialization'
  end

end
