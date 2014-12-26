require_relative 'util'
require_relative 'view'
require_relative 'user'

module App
  def self.run(username)
    user = User.new(username)
    user.view_profile
  end
end
