class Simulator

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

    def initialize(seed,prospector_count)
        @seed = seed   #Random number generator seed
        @prospector_count = prospector_count #Number of prospectors
    end

    #Starts the simulator, calls all needed methods
    #to keep the simulator running
    def play
        puts "Start Simulator"
        random_number(@seed)
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

end #end of class
