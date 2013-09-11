# Array implementation of a queue
class ArrayQueue < Array
  alias :enqueue :unshift
  alias :dequeue :pop
end
