class QuickUnionUF

  # @param [FixNum] sites_count Number of connected sites (> 0)
  def initialize(sites_count)
    @id = Array.new(sites_count) { |i| i }
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

    @id[p_root] = q_root
  end

  private
  def root(site)
    while (site != @id[site])
      site = @id[site]
    end

    site
  end

end
