class MapFinder

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
        elsif city == "El Dorado Canyon"
            index = 6
        else
            index = nil
        end
        index
    end

end
