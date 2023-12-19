require_relative 'proxy'

Anna = Bank.new(0.0)
Alex = Bank.new

Anna.remove_balance(10.0)
Anna.replenish_balance(100.0)
Anna.remove_balance(9.9)

puts '---------'

Alex.balance
