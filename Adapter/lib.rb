class OneLib
  class << self
    def regist(fname:, lname:)
      puts "Пользователь зарегистрирован!"
      puts "Имя: #{fname}"
      puts "Фамилия: #{lname}"
    end

    def subscribe(mail:)
      puts "Ваша почта #{mail} для уведомлений подтверждена"
    end
  end
end

class TwoLib
  class << self
    def create(name:)
      puts "Пользователь зарегистрирован!"
      puts "Здравтсвуйте, #{name}!"
    end

    def subscribe(tel:)
      puts "Уведомления будут приходить на телефон: #{tel}"
    end
  end
end
