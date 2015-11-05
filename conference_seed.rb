# seed database

5.times do
  # code to create speakers goes here
  p "created an instance of a speaker..."
end

5.times do
  # code to create talks goes here
  p "created an instance of a talk..."
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
