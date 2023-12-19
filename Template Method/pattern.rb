class User
  attr_reader :first_name, :last_name, :email, :tel

  def initialize
    @first_name = 'Василий'
    @last_name = 'Петров'
    @email = 'VPmail@email.com'
    @tel = '7-(***)-***-**-**'
  end
end

class System
  def start(user)
    regist(user)
    subscribe(user)
  end

  private

  def regist(user)
  end

  def subscribe(user)
  end
end

class SystemOne < System
  private
  
  def regist(user)
    puts 'Пользователь зарегистрирован!'
    puts "Имя: #{user.first_name}"
    puts "Фамилия: #{user.last_name}"
  end

  def subscribe(user)
    puts "Ваша почта #{user.email} для уведомлений подтверждена"
  end
end

class SystemTwo < System
  private
  
  def regist(user)
    puts 'Пользователь зарегистрирован!'
    puts "Здравтсвуйте, #{user.first_name}!"
  end

  def subscribe(user)
    puts "Уведомления будут приходить на телефон: #{user.tel}"
  end
end

user = User.new
system_one = SystemOne.new.start(user)
puts 
system_two = SystemTwo.new.start(user)