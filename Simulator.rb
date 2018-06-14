class Simulator

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
