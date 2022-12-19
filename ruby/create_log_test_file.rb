require 'date'
require "active_support/isolated_execution_state" 
require 'active_support/core_ext/numeric/time.rb'

file = File.new("performance_log.csv", "w")

date = DateTime.new(2022, 01, 11, 11, 13, 11)


def put_value(minutes, date, value, file)
    for index in 1..(60*minutes) do
        file.puts date.strftime("%T:%L") + "," + value.to_s
        date = date + 1.seconds
    end
end


put_value(15, date, 3000, file)
date = date + 15.minutes

put_value(15, date, 1000, file)
date = date + 15.minutes

put_value(120, date, 5000, file)
date = date + 120.minutes

put_value(120, date, 10000, file)
date = date + 120.minutes
