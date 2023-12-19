class User
  attr_reader :first_name, :last_name, :full_name, :email, :tel

  def initialize
    @first_name = "Василий"
    @last_name = "Петров"
    @full_name = @first_name + ' ' + @last_name
    @email = "VPmail@email.com"
    @tel = "7-(***)-***-**-**"
  end
end
