# Array implementation of a stack
# No need to increase or decrease the elements' capacity
# since this is already taken care of by Ruby.
class ArrayStackOfStrings
  extend Forwardable

  attr_reader :elements
  def_delegators :@elements, :push, :pop

  def initialize
    @elements = []
  end
end
