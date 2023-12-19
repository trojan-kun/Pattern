class Application
  attr_reader :included

  def initialize
    @included = 0
  end

  def open_app 
    @included += 1
    print "Открыто #{@included} окно приложения "
  end

  def close_app
    if @included > 0
      @included -= 1
      print "Осталось #{@included} окон приложения "
    else 
      print 'Нет открытых окон у приложения '
    end
  end
end

class Word < Application
  def open_app 
    super
    puts 'Word'
  end

  def close_app 
    super
    puts 'Word'
  end

  def write_a_book
    if @included > 0
      puts 'Вы написали книгу'
    else 
      puts 'Вы не можете напиать книгу'
      puts 'У вас не открыт Word'
    end
  end
end

class Excel < Application
  def open_app 
    super
    puts 'Excel'
  end

  def close_app 
    super
    puts 'Excel'
  end

  def create_a_table
    if @included > 0
      puts 'Вы создали удобную таблицу'
    else 
      puts 'Вы не можете создать таблицу'
      puts 'У вас не открыт Excel'
    end
  end
end

class PowerPoint < Application
  def open_app 
    super
    puts 'PowerPoint'
  end

  def close_app 
    super
    puts 'PowerPoint'
  end

  def create_a_presentation
    if @included > 0
      puts 'Вы создали прекрасную презентацию'
    else 
      puts 'Вы не можете создать преентацию'
      puts 'У вас не открыт PowerPoint'
    end
  end
end