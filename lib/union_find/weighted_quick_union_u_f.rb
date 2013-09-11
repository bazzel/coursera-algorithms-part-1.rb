class WeightedQuickUnionUF

  # @param [FixNum] sites_count Number of connected sites (> 0)
  def initialize(sites_count)
    @id = Array.new(sites_count) { |i| i }
    # Extra array sz[i] to count number of objects in the tree rooted at i.
    @sz = Array.new(sites_count, 1)
  end

  # @return [Boolean] true if p and q are connected, false otherwise
  #
  # @param [FixNum] p id of site (0 <= p < sites_count)
  # @param [FixNum] q id of site (0 <= q < sites_count)
  def connected?(p, q)
    root(p) == root(q)
  end

  # To merge components containing p and q,
  # set the id of p's root to the id of q's root.
  #
  # @param [FixNum] p id of site to connect (0 <= p < sites_count)
  # @param [FixNum] q id of site to connect to (0 <= q < sites_count)
  def union(p, q)
    p_root, q_root = root(p), root(q)
    shorter(p_root, q_root) ? link(p_root, q_root) : link(q_root, p_root)
  end

  private
  def root(site)
    while (site != @id[site])
      @id[site] = @id[@id[site]]
      site = @id[site]
    end

    site
  end

  def shorter(p, q)
    @sz[p] < @sz[q]
  end

  def link(p, q)
    @id[p] = q
    @sz[q] += @sz[p]
  end
end
