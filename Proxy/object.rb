class Bank
  def initialize(balance = 0.0)
    @balance = balance
  end

  def balance
    puts "Текущий баланс: #{@balance}$"
  end

  def replenish_balance(amount)
    @balance += amount
    print 'Баланс успешно пополнен! '
    self.balance
  end

  def remove_balance(amount)
    if @balance == 0.0 || (@balance - amount) < 0.0
      print 'Ошибка! на вашем счету не хватает средств! '
      self.balance
    else
      @balance -= amount
      print 'Операция прошлла успешно! '
      self.balance
    end
  end
end
