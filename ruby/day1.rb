iteration = 0;

number = rand(10)

puts "Pick your number:"

while true


    input = gets()

    if input.to_i > number 
        puts "Too big"
    elsif input.to_i < number
        puts"Too small"
    else 
        puts "That's right!"
        return
    end

end