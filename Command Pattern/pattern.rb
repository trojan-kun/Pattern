class Command
  def initialize(light)
    @light = light
  end

  def execute
    raise Error
  end
end

class TurnOnCommand < Command
  def execute
    @light.turn_on
  end
end

class TurnOffCommand < Command
  def execute
    @light.turn_off
  end
end

class Light
  def turn_on
    'Свет включен'
  end

  def turn_off
    'Свет выключен'
  end
end

class Switch
  def initialize
    @history = []
  end

  def switch_execute(light)
    @history << light.execute
    puts light.execute
  end

  def history_check
    print 'История: '
    @history.each {|action| print "[#{action}] "}
    "\n"
  end
end

class LightSwitch
  attr_reader :switch

  def initialize
    @lamp = Light.new
    @switch = Switch.new
  end

  def switch_for(command)
    command.downcase!
    case command
      when 'on'  then @switch.switch_execute(TurnOnCommand.new(@lamp))
      when 'off' then @switch.switch_execute(TurnOffCommand.new(@lamp))
      else puts 'Команда не найдена!'
    end
  end
end

client = LightSwitch.new
client.switch_for('on')
client.switch_for('OFF')
client.switch_for('gg')
client.switch.history_check