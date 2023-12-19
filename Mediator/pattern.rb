class User
  attr_reader :name, :chat
  def initialize(name, chat)
    @name = name
    @chat = chat
  end

  def send_message(message)
    @chat.show_message(@name, message)
  end
end

class Server
  attr_reader :data
  def initialize
    @data = []
  end

  def save_data(new_data)
    @data << new_data
  end
end

class ChatRoom
  def initialize(server)
    @server = server
  end

  def show_message(name, message)
    time = Time.new.strftime("%d-%m-%Y %H:%M")
    data_message = "#{time} : #{name} : #{message}"
    puts data_message
    @server.save_data(data_message)
  end
end

server = Server.new
chat = ChatRoom.new(server)
ivan = User.new('Иван', chat)
petr = User.new('Петер', chat)

ivan.send_message('Привет')
petr.send_message('Пока')

p server.data