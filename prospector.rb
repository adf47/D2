class Prospector

    def initialize(map)
        @map = map
    end

    #Method that allows prospector to mine for gold/silver at location
    def mine(iteration,city)
        set_gold_chart
        iteration = iteration.to_i
        city = city.to_i
        success = nil
        if iteration < 4 && iteration >=0 && city >= 0 && city < 7
            found = 1
            while found == 1
                silver = rand(@chart[city][0]).to_i
                puts "  Found #{silver} ounces of silver in #{@map[city][0]}"
                gold = rand(@chart[city][1]).to_i
                puts "  Found #{gold} ounces of gold in #{@map[city][0]}"
                if silver == 0 && gold == 0
                    found = 0
                end
            end
            success = 1
        end

        if iteration >= 4 && city >= 0 && city < 7
            found = 1
            while found == 1
                silver = rand(@chart[city][0]).to_i
                puts "  Found #{silver} ounces of silver in #{@map[city][0]}"
                gold = rand(@chart[city][1]).to_i
                puts "  Found #{gold} ounces of gold in #{@map[city][0]}"
                if silver < 2 && gold < 1
                    found = 0
                end
            end
            success = 1
        end
        success
    end


    #Method that picks the prospectors next location
    def next_location
    end

    #Method to keep track of prospectors locations visited.
    #Should always return 1
    def location_count
        1
    end

    #Method that initalizes chart with gold/silver possibilities
    # Index 0 = silver, Index 1 = gold
    def set_gold_chart
        @chart = [[0,2],[0,3],[0,4],[0,5],[3,3],[5,0],[10,0]]
    end
end
