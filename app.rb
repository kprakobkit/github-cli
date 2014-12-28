require_relative 'repo'
require_relative 'util'
require_relative 'user'
require_relative 'view'

module App
  def self.run(username, reponame)
    unless reponame
      user = User.find(username)
      View.display_profile(user)
    else
      user = User.find(username)
      target_repo = user.repos.find { |repo| repo.name == reponame }
      View.display_repo(user, target_repo)
    end
  end
end
