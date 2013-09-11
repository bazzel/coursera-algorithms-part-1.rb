require 'stacks_and_queues/array_stack'

class ArithmeticExpression

  class << self
    def evaluate(expression)
      operators = ArrayStack.new
      values = ArrayStack.new

      expression.delete(' ').split(//).each do |char|
        next if char == '('

        if char =~ /(\*|\+)/
          operators.push(char)
        elsif char == ')'
          operator = operators.pop
          if operator == '+'
            values.push(values.pop + values.pop)
          elsif operator == '*'
            values.push(values.pop * values.pop)
          end
        else
          values.push char.to_i
        end
      end

      values.pop
    end
  end
end
