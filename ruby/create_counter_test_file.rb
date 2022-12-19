require 'date'
require "active_support/isolated_execution_state" 
require 'active_support/core_ext/numeric/time.rb'

file = File.new("counters.csv", "w")
file.puts("\"(PDH-CSV 4.0) (Romance Standard Time)(-60)\",\"\\\\DESKTOP-91MBILA\\Process(RecorderApp)\\Private Bytes\",\"\\\\DESKTOP-91MBILA\\Process(RecorderApp)\\Working Set\",\"\\\\DESKTOP-91MBILA\\Process(RecorderApp)\Working Set - Private\",\"\\\\DESKTOP-91MBILA\\Process(RecorderApp)\\% Processor Time\",\"Generate a report detailing the status of local hardware resources, system response times, and processes on the local computer. Use this information to identify possible causes of performance issues. Membership in the local Administrators group, or equivalent, is the minimum required to run this Data Collector Set.\"")

date = DateTime.new(2022, 01, 11, 11, 13, 11)


def put_value(minutes, date, value, file)
    for index in 1..60*minutes do
        file.puts "\"" + date.strftime("%m/%d/%Y %T.%L") + ", \"" + "\"" + value.to_s + "\"," + "\"" + value.to_s + "\"," + "\"" + value.to_s + "\"," + "\"" + value.to_s + "\"," + "\"" + value.to_s + "\""
        date = date + 1.seconds
    end
end


put_value(30, date, 1, file)
date = date + 30.minutes

put_value(10, date, 5, file)
date = date + 10.minutes

put_value(10, date, 10, file)
date = date + 10.minutes

put_value(10, date, 5, file)
date = date + 10.minutes

put_value(10, date, 10, file)
date = date + 10.minutes

put_value(10, date, 5, file)
date = date + 10.minutes

put_value(10, date, 10, file)
date = date + 10.minutes

put_value(5, date, 5, file)
date = date + 5.minutes

put_value(2, date, 15, file)
date = date + 2.minutes

put_value(5, date, 3, file)
date = date + 5.minutes