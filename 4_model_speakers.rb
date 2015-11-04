require 'ffaker'
require './models/speaker.rb'

5.times do
  args = {
            first_name: FFaker::Name.first_name,
            last_name: FFaker::Name.last_name,
            email: FFaker::Internet.free_email
          }
  speaker = Speaker.create(args)
  p speaker
end
