class MyException < Exception
end


def your_name
  begin
    puts "What's your name?"
    name = gets.chomp
    raise MyException, "TESTING" if name.is_a?(String)
  rescue ZeroDivisionError
    puts "Name must be a string"
  rescue TypeError
    puts "Wrong type, bro."
    retry
  ensure
    puts "I am here whether you like it or not"
  end
end

your_name
