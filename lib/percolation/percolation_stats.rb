class PercolationStats
  def initialize(n, t, uf_clazz)
    t.times do
      percolation = Percolation.new(n, uf_clazz)
      randomizer = PercolationRandomizer.new(n)

      until percolation.percolates?
        percolation.open(*randomizer.position)
      end
    end
  end

end
