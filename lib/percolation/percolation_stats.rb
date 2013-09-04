class PercolationStats
  attr_reader :n, :open_sites_fractions
  class << self
    def main(n, t)
      instance = new(n, t, QuickUnionUF)

      "mean      = #{instance.mean}\nstddev      =#{instance.standard_deviation}\n95% confidence interval     ="
    end
  end

  def initialize(n, t, uf_clazz)
    @n = n
    @open_sites_fractions = []

    t.times { open_sites_fractions << open_sites_fraction(uf_clazz) }
  end

  def mean
    open_sites_fractions.mean
  end

  def standard_deviation
    open_sites_fractions.standard_deviation
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
    avg=mean
    sum=inject(0){|acc,i|acc +(i-avg)**2}
    sum.to_f/length
  end

  #  standard deviation of an array of numbers
  def standard_deviation
    Math.sqrt(sample_variance)
  end

end  #  module Enumerable
