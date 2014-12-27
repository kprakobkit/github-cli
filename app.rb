require_relative 'repo'
require_relative 'util'
require_relative 'user'
require_relative 'view'

module App
  def self.run(username)
    user = User.new(username)
    View.display_profile(user)
  end
end
