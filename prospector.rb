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
                puts "      Found #{silver} ounces of silver in #{@map[city][0]}" unless silver == 0
                gold = rand(@chart[city][1]).to_i
                puts "      Found #{gold} ounces of gold in #{@map[city][0]}" unless gold == 0
                if silver == 0 && gold == 0
                    found = 0
                    puts "      Found no precious metals in #{@map[city][0]}"
                end
            end
            success = 1
        end

        if iteration >= 4 && city >= 0 && city < 7
            found = 1
            while found == 1
                silver = rand(@chart[city][0]).to_i
                puts "      Found #{silver} ounces of silver in #{@map[city][0]}" unless silver == 0
                gold = rand(@chart[city][1]).to_i
                puts "      Found #{gold} ounces of gold in #{@map[city][0]}" unless gold == 0
                if silver < 2 && gold < 1
                    found = 0
                end
            end
            success = 1
        end
        success
    end

    #Generates random number based on passed in seed.
    def random_number(seed,range)
        seed = seed.to_i
        if seed > 0
            rng2 = Random.new(seed)
            num = rng2.rand(range) + 1
            num
        end
    end

    #Method that picks the prospectors next location
    def next_location(current_city,seed,prospector)
        next_city = random_number(seed,@map[current_city].length)
        if next_city == 0
            next_city+=1
        end
        puts "Prospector #{prospector} is traveling to #{@map[current_city][next_city]}"

        #Gets next_city location on map to return
        get_city_index(@map[current_city][next_city])

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

    #Method to get which index new city location is in 2D array
    def get_city_index(city)
        index = -1
        if city == "Sutter Creek"
            index = 0
        elsif city == "Coloma"
            index = 1
        elsif city == "Angels Camp"
            index = 2
        elsif city == "Nevada City"
            index = 3
        elsif city == "Virginia City"
            index = 4
        elsif city == "Midas"
            index = 5
        else
            index = 6
        end
    end
end
