require_relative 'prospector'

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
        pete = Prospector.new()
        run_simulation(@prospector_count,pete)
    end

    #sets up the map
    def set_map
        #Sets up map of cities
        @map = [
                    ["Sutter Creek","Coloma"],
                    ["Sutter Creek","Angels Camp"],
                    ["Coloma","Virginia City"],
                    ["Coloma","Sutter Creek"],
                    ["Angels Camp","Nevada City"],
                    ["Angels Camp","Virginia City"],
                    ["Angels Camp","Sutter Creek"], #this one might go?
                    ["Nevada City","Angels Camp"],
                    ["Virginia City","Angels Camp"],
                    ["Virginia City","Coloma"],
                    ["Virginia City","Midas"],
                    ["Virginia City","El Dorado Canyon"],
                    ["Midas","Virginia City"],
                    ["Midas","El Dorado Canyon"],
                    ["El Dorado Canyon","Virginia City"],
                    ["El Dorado Canyon","Midas"]
                ]
    end

    #Generates random number based on passed in seed.
    def random_number(seed)
        seed = seed.to_i
        if seed > 0
            rng2 = Random.new(seed)
            num = rng2.rand(seed) + 1
            num
        end
    end

    #Starts the prospector simulation
    def run_simulation(prospector_count,pete)
        prospector_count = prospector_count.to_i
        #Iterate through each prospector
        success = nil
        count = 0
        x = 1 # needs at least 1 prospector
        y = 0 #location/city
        z = 0
        while x <= prospector_count do
            while y < @map.length
                while z < @map[y].length
                    if y == 0 && z == 0 && count < 5
                        puts "Prospector #{x} is starting in #{@map[y][z]}"
                        pete.mine()
                        pete.next_location()
                        count = count + pete.location_count()
                        #puts "Prospector #{x} is heading from #{@map[y][z]} to.."
                    end
                    if y > 0 && count < 5
                        puts "Prospector #{x} is heading from #{@map[y][z]} to.."
                        pete.mine()
                        pete.next_location()
                        count = count + pete.location_count()
                    end
                    z = z + 1
                end
                z = 0
                y = y + 1
            end
            y = 0
            x = x + 1
            success = count #to test we reach 5 locations
            count = 0
        end
        success # for testing purposes to know if method passed
    end

end
#end of class
