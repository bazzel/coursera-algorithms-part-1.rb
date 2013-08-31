class PercolationStats
  def initialize(n, t, uf_clazz)
    t.times do
      percolation = Percolation.new(n, uf_clazz)
      n.times do
        percolation.open(1,1)
      end
    end
  end

end
