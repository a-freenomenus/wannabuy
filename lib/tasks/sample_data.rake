require 'faker'

namespace :db do
  desc 'Fill db with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => 'Example User',
                 :email => 'example@example.by',
                 :password => 'password',
                 :password_confirmation => 'password')
    admin = User.create!(:name => 'Administrator',
                         :email => 'admin@example.by',
                         :password => 'password',
                         :password_confirmation => 'password')
    admin1 = User.create!(:name => 'Leaser Geen',
                         :email => 'leaser.geen@gmail.com',
                         :password => 'password',
                         :password_confirmation => 'password')
    admin1.toggle!(:admin)
    admin.toggle!(:admin)

    # 99.times do |n|
    #   name = Faker::Name.name
    #   email = "example-#{n+1}@example.by"
    #   password = "password"
    #   User.create!(:name => name,
    #                :email => email,
    #                :password => password,
    #                :password_confirmation => password)
    #   
    # end

    User.all(:limit => 6).each do |user|
      5.times do
        @r = user.requests.build( :name       => Faker::Lorem.sentence(5),
                                  :description => Faker::Lorem.sentence(33))
        @r.status = 'started'
        @r.save
      end
      15.times do
        @r = user.requests.build( :name        => Faker::Lorem.sentence(6),
                                  :description => Faker::Lorem.sentence(44))
        @r.status = 'not-started'
        @r.save
      end
      3.times do
        @r = user.requests.build( :name        => Faker::Lorem.sentence(6),
                                  :description => Faker::Lorem.sentence(44))
        @r.status = 'finished'
        @r.save
      end
      4.times do
        @r = user.requests.build( :name        => Faker::Lorem.sentence(6),
                                  :description => Faker::Lorem.sentence(44))
        @r.status = 'closed'
        @r.save
      end
    end

  end
end

