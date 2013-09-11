require 'spec_helper'
require 'stacks_and_queues/array_stack_of_strings'

describe ArrayStackOfStrings do
  subject do
    described_class.new
  end
  let(:stack) do
    subject
  end

  it 'implements LIFO' do
    result = []
    stack.push 'to'
    stack.push 'be'
    stack.push 'or'
    stack.push 'not'
    stack.push 'to'
    result << stack.pop
    stack.push 'be'
    result << stack.pop
    result << stack.pop
    stack.push 'that'
    result << stack.pop
    result << stack.pop
    result << stack.pop
    stack.push 'is'

    result.should == %w(to be not that or be)
  end
end

