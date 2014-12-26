require_relative 'util'
require_relative 'user'
require_relative 'view'

module App
  def self.run(username)
    user = User.new(username)
    user.view_profile
  end
end
