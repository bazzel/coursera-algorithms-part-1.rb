require 'spec_helper'
require 'percolation/percolation_randomizer'

describe PercolationRandomizer do
  describe '#position' do
    subject        { instance.position }
    let(:instance) { described_class.new(n) }
    let(:n)        { 2 }

    it 'returns an array' do
      subject.should be_an(Array)
    end

    it 'returns an array with positions' do
      position = subject
      position.first.should be > 0
      position.first.should be <= n

      position.last.should be > 0
      position.last.should be <= n
    end

    fit 'returns every element once in random order' do
      positions = []
      4.times do
        positions << instance.position
      end

      positions.should =~ [[1,1], [1,2], [2,1], [2,2]]
    end
  end
end
