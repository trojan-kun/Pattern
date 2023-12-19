module Observer
  def initialize
    @observers = []
  end

  def add_observer(event_type, observer)
    @observers << { event_type: event_type, observer: observer }
  end

  def delete_observer(event_type, observer)
    @observers.delete(event_type: event_type, observer: observer)
  end

  def notify_observers(event_type)
    selected_observers = @observers.select do |observer|
      observer[:event_type] == event_type
    end

    selected_observers.each do |observer|
      observer[:observer].update(self)
    end
  end
end

class Book
  include Observer
  attr_reader :title, :count

  def initialize(title, count, storekeeper)
    super()
    @title = title
    @count = count

    self.add_observer(:not_enough_books, storekeeper)
  end

  def sell_one_book!
    return false if @count.zero?
    @count -= 1
    notify_observers(:not_enough_books) if @count.zero?
    true
  end

  def count=(new_count)
    @count = new_count
    notify_observers(:new_books) if new_count > 0
  end

  def show_count
    puts "Количество '#{@title}' на полках: #{@count}"
  end
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def update(book)
    puts "#{@name}: Клиент может купить книгу '#{book.title}' снова!"
  end

  def buy_a_book(book)
    if book.sell_one_book!
      puts "#{@name} купил(а) книгу"
      book.show_count
    else
      puts "#{@name} не купил(а) книгу"
      book.show_count
      book.add_observer(:new_books, self)
    end
  end
end

class Storekeeper
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def update(book)
    puts "#{@name}: необзодимо пополнить запас '#{book.title}' на полках!"
  end

  def add_book_count(book, new_count)
    puts "#{@name}: пополнил запас '#{book.title}' на полках!"
    book.count = new_count
  end
end

alex = Storekeeper.new('Алексей')
book = Book.new('Оно', 2, alex)

vova = Customer.new('Вова')
vova.buy_a_book(book)
puts '-------'
alice = Customer.new('Алиса')
alice.buy_a_book(book)
puts '-------'
roma = Customer.new('Рома')
roma.buy_a_book(book)
puts '-------'
alex.add_book_count(book, 10)
puts '-------'
roma.buy_a_book(book)