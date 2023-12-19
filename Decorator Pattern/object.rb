require_relative 'module'

class Human
  def initialize(name)
    @name = name
  end

  def breathe
    puts "#{@name} надышал(а)"
  end
end