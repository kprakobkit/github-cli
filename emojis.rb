require 'net/http'
require 'uri'
require 'json'

uri = URI('https://api.github.com/emojis')

response = Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == "https") do |http|
  req = Net::HTTP::Get.new uri

  http.request req
end

def print_emoji_names(json)
  JSON.parse(json).keys.each { |name| puts name }
end

print_emoji_names(response.body)

