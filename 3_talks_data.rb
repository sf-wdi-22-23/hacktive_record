require 'ffaker'

puts "Speakers"
puts "========"
5.times do
  speaker = {
              first_name: FFaker::Name.first_name,
              last_name: FFaker::Name.last_name,
              email: FFaker::Internet.free_email
            }
  p speaker
end

puts "\nTalks"
puts "====="
5.times do
  talk = {
    topic: FFaker::Company.catch_phrase,
    duration: rand(1..6)*15
  }
  p talk
end
