module ActAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def act_as_csv
            include InstanceMethods
        end
    end

    class CsvRow
        def initialize(headers, row)
            @headers = headers
            @row = row
        end

        def method_missing(name, *args, &block)
            name_string = name.to_s
            return @row[@headers.index(name_string)]
        end
    end

    module InstanceMethods
        def read
            file = File.new(self.class.to_s.downcase + '.txt')
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @result << row.chomp.split(', ')
            end
        end

        def headers
            @headers 
        end

        def csv_contents
            @result
        end

        def initialize
            @result = []
            read
        end

        def each(&block)
            mapped = @result.map {|r| CsvRow.new(@headers, r)}
            mapped.each(&block)
        end
    end
end

class RubyCsv
    include ActAsCsv
    act_as_csv
end

m = RubyCsv.new


m.each { |row| p row.Test2 }
