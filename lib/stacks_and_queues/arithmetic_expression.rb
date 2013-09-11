#  Two-stack algorithm. [E. W. Dijkstra]
#  Value: push ontothe value stack
#  Operator: push onto the operator stack
#  Left parenthesis: ignore
#  Right parenthesis: pop operator and 2 values;
#  push the result of applying that operator to
#  those values onto the value stack
require 'stacks_and_queues/array_stack'

class ArithmeticExpression
  attr_reader :expression, :operators, :values

  class << self
    def evaluate(expression)
      new(expression).evaluate
    end
  end

  def initialize(expression)
    @expression = expression
    @operators = ArrayStack.new
    @values = ArrayStack.new
  end

  def evaluate
    expression.each { |char| handle(char) }
    values.pop
  end

  def expression
    @expression.delete(' ').split(//)
  end

  private
  def handle(char)
    case char
    when '('       then return
    when /(\*|\+)/ then operators.push(char)
    when ')'       then calculate(operators.pop)
    else                values.push char.to_i
    end
  end

  def calculate(operator)
    case operator
    when '+' then values.push(values.pop + values.pop)
    when '*' then values.push(values.pop * values.pop)
    end
  end
end
