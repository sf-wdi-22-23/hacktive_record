require "./hacktive_record.rb"

class Speaker < HacktiveRecord::Base

  attr_accessor :first_name, :last_name, :email, :id

end
