# seed database

5.times do
  Speaker.create({
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    email: FFaker::Internet.free_email
  })
end

5.times do
  Talk.create({
    topic: FFaker::Company.catch_phrase,
    duration: rand(1..6)*15
  })
end

# print to console

puts "Speakers"
puts "========"
Speaker.all.each do |speaker|
  p speaker
end

puts "Talks"
puts "========"
Talk.all.each do |talk|
  p talk
end
