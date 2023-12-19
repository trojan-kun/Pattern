class Calculator
  def initialize(strategy)
    @strategy = strategy
  end

  def change_strategy(new_strategy)
    @strategy = new_strategy
  end

  def calculation(one, two)
    @strategy.calculation(one, two)
  end
end

class Arithmetic
  def calculation(one, two)
  end
end

class Addition
  def calculation(one, two)
    puts "#{one} + #{two} = #{one + two}"
  end
end

class Subtraction
  def calculation(one, two)
    puts "#{one} - #{two} = #{one - two}"
  end
end

class Multiplication
  def calculation(one, two)
    puts "#{one} * #{two} = #{one * two}"
  end
end

addition = Addition.new
subtraction = Subtraction.new
multiplication = Multiplication.new

calculator = Calculator.new(addition)
calculator.calculation(5, 10)

calculator.change_strategy(subtraction)
calculator.calculation(7, 10)

calculator.change_strategy(multiplication)
calculator.calculation(3, 2)
