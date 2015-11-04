require 'ffaker'
require './models/speaker.rb'

# create 5 new speakers
5.times do
  args = {
            first_name: FFaker::Name.first_name,
            last_name: FFaker::Name.last_name,
            email: FFaker::Internet.free_email
          }
  Speaker.create(args)
end

# show all the speakers
p Speaker.all
