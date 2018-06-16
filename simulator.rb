require_relative 'prospector'
require_relative 'map_finder'

class Simulator

    def initialize(seed,prospector_count)
        @seed = seed   #Random number generator seed
        @prospector_count = prospector_count #Number of prospectors
    end

    #Starts the simulator, calls all needed methods
    #to keep the simulator running
    def play
        puts "Start Simulator"
        set_map
        x = 1
        while x <= @prospector_count
            pete = Prospector.new(@map,MapFinder.new)
            run_simulation(x,pete)
            pete.see_results(x)
            x=x+1
        end
    end

    #sets up the map
    def set_map
        #Sets up map of cities
        @map = [
                    ["Sutter Creek","Coloma","Angels Camp"],
                    ["Coloma","Virginia City","Sutter Creek"],
                    ["Angels Camp","Nevada City","Virginia City","Sutter Creek"],
                    ["Nevada City","Angels Camp"],
                    ["Virginia City","Angels Camp","Coloma","Midas","El Dorado Canyon"],
                    ["Midas","Virginia City","El Dorado Canyon"],
                    ["El Dorado Canyon","Virginia City","Midas"]
              ]
    end

    #Starts the prospector simulation
    def run_simulation(prospector_count,pete)
        prospector_count = prospector_count.to_i
        #Iterate through each prospector
        success = nil
        count = 0
        y = 0
        while count < 5 && prospector_count > 0
            if y == 0 && count == 0
                puts "\nProspector #{prospector_count} is starting in #{@map[y][0]}"
                pete.mine(count,y,@seed)
                count = count + pete.location_count()
                y = pete.next_location(y,@seed,prospector_count) unless count >= 5
            elsif y >= 0 && count < 5
                pete.mine(count,y,@seed)
                count = count + pete.location_count()
                y = pete.next_location(y,@seed,prospector_count) unless count > 5
            end
            success = count
        end
        success
    end

end
#end of class
