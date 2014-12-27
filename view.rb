module View
  def self.display_profile(user)
    puts "Name: #{user.name}"
    puts "Location: #{user.location}"
    puts "Public Repos: #{user.public_repos}"
    user.repos.each do |repo|
      puts "    *  #{repo.name} (#{repo.watchers} watchers)"
    end
  end
end

