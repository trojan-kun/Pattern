require_relative 'user'
require_relative 'system'

class Client
  def self.call(platform:, user:)
    platform.register(user)
    platform.subscribe(user)
  end
end