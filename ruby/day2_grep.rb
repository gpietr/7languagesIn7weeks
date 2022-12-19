File.readlines(ARGV[0]).each_with_index do |line, number|
    if line.include? "recorder"
        puts number.to_s + ": " + line
    end
end