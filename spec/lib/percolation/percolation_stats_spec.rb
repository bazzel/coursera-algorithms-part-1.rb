require 'spec_helper'
require 'percolation/percolation_stats'
require 'percolation/percolation'
require 'percolation/percolation_randomizer'
require 'quick_union_u_f'

describe PercolationStats do
  describe '.new' do
    subject                { described_class.new(n,t,uf) }
    let(:uf)               { QuickUnionUF }
    let(:n)                { 5 }
    let(:t)                { 2 }
    let(:randomizer_stub) { double('PercolationRandomizer') }
    let(:percolation_stub) { Percolation.new(n, uf) }

    before do
      percolation_stub.stub(:open) { true }
      Percolation.stub(:new).and_return(percolation_stub)

      PercolationRandomizer.stub(:new).and_return(randomizer_stub)
    end

    describe 'create a Percolation instance' do
      before do
        percolation_stub.stub(:percolates?) { true }
      end

      it 'of NxN with speficied UnionFind class' do
        Percolation.should_receive(:new).at_least(:once).with(n, uf)
        subject
      end

      it 'T times a Percolation instance' do
        Percolation.should_receive(:new).exactly(t).times
        subject
      end

    end
    describe 'calling open' do
      let(:t) { 1 }

      context 'on a 1x1 Percolation' do
        let(:n) { 1 }
        before do
          randomizer_stub.stub(:position).and_return([1,1])
        end

        it 'opens 1 site' do
          percolation_stub.should_receive(:open).with(1,1).exactly(1).times.and_call_original
          subject
        end
      end

      context 'on a 2x2 Percolation' do
        let(:n) { 2 }
        before do
          randomizer_stub.stub(:position).and_return([1,1], [2,2], [1,2], [2,1])
        end

        it 'opens at most 3 sites' do
          percolation_stub.should_receive(:open).at_most(3).times.and_call_original
          subject
        end

        it 'opens at least one site in every row' do
          1.upto(n) do |r|
            percolation_stub.should_receive(:open).with(r, anything).at_least(1).times.and_call_original
          end
          subject
        end

        it 'opens at least one site in every column' do
          1.upto(n) do |c|
            percolation_stub.should_receive(:open).with(anything, c).at_least(1).times.and_call_original
          end
          subject
        end
      end
    end
  end
end
