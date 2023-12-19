require_relative 'adapter'

Client.call(platform: SystemOne, user: User.new)
puts "\n--------\n"
Client.call(platform: SystemTwo, user: User.new)
