require_relative 'object'

class BankAccount
  def initialize(balance = 0.0, access = false)
    @account = Bank.new(balance)
    @access = access
  end

  def balance
    unless @access
      raise 'Нет доступа для просмотра средств!'
    else
    @account.balance
    end
  end

  def replenish_balance(amount)
    unless @access
      raise 'Нет доступа для пополнения средств!'
    else
      @account.replenish_balance(amount)
    end
  end

  def remove_balance(amount)
    unless @access 
      raise 'Нет доступа для снятия средств!'
    else
      @account.remove_balance(amount)
    end
  end
end
