class Light
  def turn_on
    'Свет включен'
  end

  def turn_off
    'Свет выключен'
  end
end

class LightSwitch
  def initialize
    @light = Light.new
    @history = []
  end

  def switch_for(command)
    case command.downcase
      when 'on' then result = @light.turn_on
      when 'off' then result = @light.turn_off
      else result = 'Команда не найдена!'
    end
    @history << result
    puts result
  end

  def history_check
    print 'История: '
    @history.each { |action| print "[#{action}] " }
    puts
  end
end

client = LightSwitch.new
client.switch_for('on')
client.switch_for('OFF')
client.switch_for('gg')
client.history_check