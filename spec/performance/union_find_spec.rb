require 'spec_helper'
require 'benchmark'
%w(quick_find_u_f quick_union_u_f weighted_quick_union_u_f).each do |f|
  require f
end

# To run this test:
#   bundle exec rspec spec --tag @performance
Benchmark.bm(28) do |bm|
  describe 'performance', performance: true do
    let(:c)    { 100 }
    let(:b)    { 2 }
    let(:runs) { 8 }

    it 'measures the running time for different implementations' do
      [QuickFindUF, QuickUnionUF, WeightedQuickUnionUF].each do |clazz|
        runs.times do |x|
          sites_count = c*b**x
          instance = clazz.new(sites_count)
          bm.report("#{clazz} (#{sites_count})") do
            connect(instance, sites_count)
            instance.connected?(0, sites_count-1).should be_true
          end
        end
      end
    end

    def connect(instance, sites_count)
      0.upto(sites_count - 2) { |i| instance.union(i, i+1) }
    end
  end
end
