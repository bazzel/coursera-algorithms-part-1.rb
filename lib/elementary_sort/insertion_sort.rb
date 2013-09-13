# Algorithm. ↑ scans from left to right.
# Invariants:
#  ・Entries to the left of ↑ (including ↑) are in ascending order.
#  ・Entries to the right of ↑ have not yet been seen.
require 'elementary_sort/sort_helpers'

module InsertionSort
  include SortHelpers

  def sort
    each_index do |i|
      i.downto(1) do |j|
        exch(j, j-1) if less?(j, j-1)
      end
    end

    self
  end
end
