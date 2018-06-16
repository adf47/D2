class Prospector

    def initialize(map,map_finder)
        @map = map
        @map_finder = map_finder
        @gold_total = 0
        @silver_total = 0
        @visited_locations = 1
    end

    #Method that allows prospector to mine for gold/silver at location
    def mine(iteration,city,seed)
        set_gold_chart
        iteration = iteration.to_i
        city = city.to_i
        success = nil
        if iteration < 4 && iteration >=0 && city >= 0 && city < 7
            found = 1
            while found == 1
                silver = rand(@chart[city][0]).to_i
                puts "      Found #{silver} ounces of silver in #{@map[city][0]}" unless silver == 0
                @silver_total = @silver_total + silver
                gold = rand(@chart[city][1]).to_i
                puts "      Found #{gold} ounces of gold in #{@map[city][0]}" unless gold == 0
                @gold_total = @gold_total + gold
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
                if silver == 0 && gold == 0
                    puts "      Found no precious metals in #{@map[city][0]}"
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
        if current_city < 0 || current_city >= 7
            return nil
        end
        range = 1
        range = @map[current_city].length-1 unless @map[current_city].length <= 1
        next_city = random_number(seed,range)

        if next_city == 0
            next_city+=1
        end
        if next_city == nil
            return nil
        end
        puts "Heading from #{@map[current_city][0]} to #{@map[current_city][next_city]}, holding #{@silver_total} ounces of silver and #{@gold_total} ounces of gold." unless @visited_locations >= 5

        #Gets next_city location on map to return
        @visited_locations+=1
        city = @map_finder.get_city_index(@map[current_city][next_city])
        city
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

    #Method to display prospectors results
    def see_results
        puts "\n\n"
        puts "Collected #{@silver_total} ounces of silver"
        puts "Collected #{@gold_total} ounces of gold"
        puts "\n\n"
    end

end
