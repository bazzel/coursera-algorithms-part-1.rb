require 'spec_helper'
require 'percolation/percolation_stats'
require 'percolation/percolation'
require 'quick_union_u_f'

describe PercolationStats do
  describe '.new' do
    subject                { described_class.new(n,t,uf) }
    let(:uf)               { QuickUnionUF }
    let(:n)                { 5 }
    let(:t)                { 2 }
    let(:percolation_stub) { double('Percolation').as_null_object }

    before do
      Percolation.stub(:new).and_return(percolation_stub)
    end

    it 'creates a Percolation instance of NxN with speficied UnionFind class' do
      Percolation.should_receive(:new).at_least(:once).with(n, uf)
      subject
    end

    it 'creates T times a Percolation instance' do
      Percolation.should_receive(:new).exactly(t).times
      subject
    end

    it 'opens sites until it percolates' do
      percolation_stub.should_receive(:open).at_least(n*t).times
      subject
    end
  end
end
