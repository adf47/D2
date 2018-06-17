# Class that locates city loaction on map and gets its index in 2D array
class MapFinder
  # Method to get which index new city location is in 2D array
  def get_city_index(city)
    index = if city == 'Sutter Creek'
              0
            elsif city == 'Coloma'
              1
            elsif city == 'Angels Camp'
              2
            elsif city == 'Nevada City'
              3
            elsif city == 'Virginia City'
              4
            elsif city == 'Midas'
              5
            elsif city == 'El Dorado Canyon'
              6
            end
    index
  end
end
