require 'spec_helper'
require 'stacks_and_queues/arithmetic_expression'

describe ArithmeticExpression do
  subject          { described_class.evaluate expression }
  let(:expression) { '(1+((2+3)*(4*5)))' }

  it { should == 101 }
end
