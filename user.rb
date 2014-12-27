require 'ostruct'
require_relative 'util'

class User
  attr_reader :repos

  def self.find(username)
    self.new(username)
  end

  def initialize(username)
    @username = username
    @repos = get_user_repos
    create_methods
  end

  def create_methods
    profile = Util.get_response("users/#{@username}")
    profile.each { |key, value| define_singleton_method key.to_sym, -> { value } }
  end

  def get_user_repos
    repos = Util.get_response("users/#{@username}/repos").map { |data| Repo.new(data) }
    repos.sort_by(&:watchers).reverse
  end
end
