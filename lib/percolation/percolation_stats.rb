require 'forwardable'
require 'weighted_quick_union_u_f'
require 'percolation/percolation'
require 'percolation/percolation_randomizer'

class PercolationStats
  extend Forwardable

  attr_reader :n, :open_sites_fractions
  def_delegators :@open_sites_fractions, :mean, :standard_deviation, :confidence

  class << self
    def main(n, t)
      result_for(new(n, t, WeightedQuickUnionUF))
    end

    private
    def result_for(instance)
      result = []
      result << "mean                    = #{instance.mean}"
      result << "stddev                  = #{instance.standard_deviation}"
      result << "95% confidence interval = #{instance.confidence(:lower)}, #{instance.confidence(:upper)}"

      result.join("\n")
    end
  end

  def initialize(n, t, uf_clazz)
    @n = n
    @open_sites_fractions = []

    t.times { open_sites_fractions << open_sites_fraction(uf_clazz) }
  end

  private
  def open_sites_fraction(uf_clazz)
    percolation      = Percolation.new(n, uf_clazz)
    randomizer       = PercolationRandomizer.new(n)
    open_sites_count = 0

    until percolation.percolates?
      percolation.open(*randomizer.position)
      open_sites_count += 1
    end

    open_sites_count.to_f/(n*n)
  end
end

#  Add methods to Enumerable, which makes them available to Array
module Enumerable
  def mean
    reduce(:+).to_f/size
  end

  #  variance of an array of numbers
  def sample_variance
    avg = mean
    sum = inject(0){|acc,i|acc +(i-avg)**2}
    sum.to_f/size
  end

  #  standard deviation of an array of numbers
  def standard_deviation
    Math.sqrt(sample_variance)
  end

  def confidence(bound)
    avg = mean
    delta = 1.96*standard_deviation / Math.sqrt(size)
    if bound == :upper
      avg + delta
    else
      avg - delta
    end
  end
end  #  module Enumerable
