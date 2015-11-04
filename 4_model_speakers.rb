require 'ffaker'
require './models/speaker.rb'

5.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  email = FFaker::Internet.free_email
  # speaker = Speaker.new({})
end
