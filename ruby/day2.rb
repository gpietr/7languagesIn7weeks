items = (1...17)

output = ""
items.each_with_index do |i, index|
    output = output + " " + i.to_s
    index = index + 1
    if index%4 == 0
        puts output
        output = ""
    end 
end


items.each_slice(4){|slice| p slice}