class PercolationStats
  attr_reader :n, :open_sites_fractions
  class << self
    def main(n, t)
      instance = new(n, t, QuickUnionUF)

      "mean      = #{instance.mean}\nstddev      =\n95% confidence interval     ="
    end
  end

  def initialize(n, t, uf_clazz)
    @n = n
    @open_sites_fractions = []

    t.times { open_sites_fractions << open_sites_fraction(uf_clazz) }
  end

  def mean
    open_sites_fractions.reduce(:+) / n
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

    open_sites_count.to_f/n
  end

end
