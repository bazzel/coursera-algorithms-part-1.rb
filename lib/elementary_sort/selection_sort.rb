# Algorithm. ↑ scans from left to right.
# Invariants:
#  ・Entries the left of ↑ (including ↑) fixed and in ascending order.
#  ・No entry to right of ↑ is smaller than any entry to the left of ↑.
module SelectionSort
  def sort
    each_index do |i|
      min = i
      (i+1).upto(self.size-1) do |j|
        min = j if less?(j, min)
      end
      exch(i, min)
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
