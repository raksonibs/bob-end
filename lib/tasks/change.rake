require 'bcrypt'

namespace :change do 
  desc 'Update existing users'
  task :pass => :environment do 
    User.all.each do |user|
      user.password = '123'
      user.save
    end
  end
end