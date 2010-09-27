require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_colors
    make_swatches
  end
end
   
def make_users
  admin = User.create!(:username => "meleyal",
               :email => "william.meleyal@gmail.com",
               :password => "password",
               :password_confirmation => "password")
  admin.toggle!(:admin)

  9.times do |n|
    username  = Faker::Internet.user_name
    email = "example-#{n+1}@email.com"
    password  = "password"
    User.create!(:username => username,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end  
end    

def make_colors
  colors = [
    '#82FF00',
    '#F6D314',
    '#FF7800',
    '#DE1F7A',
    '#A882E9',
    '#EC888F',
    '#2CDDFF',
    '#909FBA',
    '#5DFFB6',
    '#4778B3'
  ]
  colors.each do |color|
    Color.create!(:value => color)
  end
end

def make_swatches
  # all_colors = Color.all
  # colors = all_colors[0..10]
  # users = User.all
  #   User.all(:limit => 6).each do |user|
  #     10.times do
  #       user.microposts.create!(:content => Faker::Lorem.sentence(5))
  #     end
  #   end


  User.all.each do |user|
    Color.all.each do |color|
      user.swatches.create!(:color_id => color.id)
    end    
  end
  

end
