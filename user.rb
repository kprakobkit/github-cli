require 'ostruct'

class User
  include Util
  attr_reader :profile

  def initialize(username)
    @username = username
    @profile = OpenStruct.new(Util.get_response("users/#{@username}"))
    @public_repos = Util.get_response("users/#{@username}/repos").sort_by { |repo| repo["watchers"].to_i }.reverse.map { |repo| OpenStruct.new repo }
  end

  def view_profile
    View.display_profile(@profile, @public_repos)
  end
end

