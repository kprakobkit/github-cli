require_relative 'util'

class Repo
  attr_reader :events
  def initialize(username, data)
    create_methods(data)
    @events = get_repo_events(username, self.name)
  end

  def create_methods(data)
    data.each { |key, value| define_singleton_method key.to_sym, -> { value } }
  end

  def get_repo_events(username, repo_name)
    @events = Util.get_response("repos/#{username}/#{repo_name}/events")
  end
end
