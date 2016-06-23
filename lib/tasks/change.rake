require 'bcrypt'

namespace :change do 
  desc 'Update existing users'
  task :pass => :environment do 
    User.all.each do |user|
      user.password = '123'
      user.save
    end
  end

  desc 'Update existing locations'
  task :locs => :environment do
    locs = ["North America", "North America", "Asia", "Europe", "North America", "Africa", "Africa", "Oceania"] 
    Location.all.each_with_index do |location, index|
      location.continent = locs[index]
      location.country = locs[index]
      location.save
    end
  end

  desc 'Create some more locs'
  task :images => :environment do 
    Article.all.update_all({image_url: 'http://lorempixel.com/400/200/'})
  end
end