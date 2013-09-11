class QuickFindUF

  # @param [FixNum] sites_count Number of connected sites (> 0)
  def initialize(sites_count)
    @id = Array.new(sites_count) { |i| i }
  end

  # @return [Boolean] true if p and q are connected, false otherwise
  #
  # @param [FixNum] p id of site (0 <= p < sites_count)
  # @param [FixNum] q id of site (0 <= q < sites_count)
  def connected?(p, q)
    @id[p] == @id[q]
  end

  # To merge sites `p` and `q`, change all entries whose id
  # equals @id[p] to @id[q].
  #
  # @param [FixNum] p id of site to connect (0 <= p < sites_count)
  # @param [FixNum] q id of site to connect to (0 <= q < sites_count)
  def union(p, q)
    p_id, q_id = @id[p], @id[q]

    @id.each_with_index do |item, index|
      @id[index] = q_id if item == p_id
    end
  end
end

