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

