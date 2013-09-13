# Algorithm. ↑ scans from left to right.
# Invariants:
#  ・Entries to the left of ↑ (including ↑) are in ascending order.
#  ・Entries to the right of ↑ have not yet been seen.
module InsertionSort
  def sort
    0.upto(size-1) do |i|
      i.downto(1) do |j|
        if less?(j, j-1)
          exch(j, j-1)
        end
      end

    end
    self
  end

  private
  def less?(v, w)
    self[v] < self[w]
  end

  def exch(i, j)
    self[i], self[j] = self[j], self[i]
  end
end
