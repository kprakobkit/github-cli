module View
  def self.display_profile(user)
    puts "Name: #{user.name}"
    puts "Location: #{user.location}"
    puts "Public Repos: #{user.public_repos}"
    user.repos.each do |repo|
      puts "    *  #{repo.name} (#{repo.watchers} watchers)"
    end
  end

  def self.display_repo(user, repo)
    puts "Name: #{user.name}"
    puts "Location: #{user.location}"
    puts "Repository: #{repo.name}"
    repo.events.each do |event|
      puts "    *  #{event["type"][0..-6]}ed by #{event["actor"]["login"]}"
    end
  end
end

