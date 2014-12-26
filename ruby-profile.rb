require 'net/http'
require 'uri'
require 'json'
require 'ostruct'

module Util
  def self.get_response(endpoint)
    token = "2c627024d6e6bcae6f275f10b3ed8bfff2f8602c"
    uri = URI("https://api.github.com/#{endpoint}")
    uri.query = URI.encode_www_form('access_token' => token)

    response = Net::HTTP.start(uri.host, uri.port,
                               :use_ssl => uri.scheme == "https") do |http|
      req = Net::HTTP::Get.new uri

      http.request req
    end
    JSON.parse(response.body)
  end
end

module View
  def self.display_profile(profile, public_repos)
    puts "Name: #{profile.name}"
    puts "Location: #{profile.location}"
    puts "Public Repos: #{profile.public_repos}"
    public_repos.each do |repo|
      puts "    *  #{repo.name} (#{repo.watchers} watchers)"
    end
  end
end

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

user = User.new(ARGV[0])
user.view_profile
