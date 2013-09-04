require 'spec_helper'
require 'benchmark'
%w(percolation/percolation_stats).each do |f|
  require f
end

# To run this test:
#   bundle exec rspec spec --tag @performance
#
# Consult doc/percolation/index.html for more information.
Benchmark.bm(28) do |bm|
  describe 'performance', performance: true do
    it 'comes closer and closer to a site vacancy probabilty of 59%' do
      runs = [
        [10, 10],
        [10, 100],
        [10, 1000],
        [10, 10000],
        [50, 10],
        [50, 100],
        [100, 100]
      ]
      runs.each do |run|
        puts Percolation::PercolationStats.main(*run)
      end
    end
  end
end
