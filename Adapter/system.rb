require_relative 'lib'

class SystemOne
  class << self
    def register(user)
      OneLib.regist(fname: user.first_name, lname: user.last_name)
    end
  
    def subscribe(user)
      OneLib.subscribe(mail: user.email)
    end
  end
end

class SystemTwo
  class << self
    def register(user)
      TwoLib.create(name: user.full_name)
    end
    
    def subscribe(user)
      TwoLib.subscribe(tel: user.tel)
    end
  end
end
