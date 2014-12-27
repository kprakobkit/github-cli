require 'json'
require 'net/http'
require 'uri'

module Util
  def self.get_response(endpoint)
    token = "2c627024d6e6bcae6f275f10b3ed8bfff2f8602c"
    uri = URI("https://api.github.com/#{endpoint}")
    uri.query = URI.encode_www_form('access_token' => token)

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == "https") do |http|
      req = Net::HTTP::Get.new uri
      http.request req
    end
    JSON.parse(response.body)
  end
end
