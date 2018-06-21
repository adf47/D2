# Class that forms the prospector that searches for precious metals
class Prospector
  def initialize(map, map_finder)
    @map = map
    @map_finder = map_finder
    @gold_total = 0
    @silver_total = 0
    @visited_locations = 1
    @days_mined = 0
    set_gold_chart
  end

  # Method that allows prospector to mine for gold/silver at location
  def mine(iteration, city)
    iteration = iteration.to_i
    city = city.to_i
    return nil if iteration < 0 || city < 0 || city >= 7
    success = 1
    if iteration < 4
      loop do
        @days_mined += 1
        silver = rand(@chart[city][0]).to_i
        puts "      Found #{silver} ounce of silver in #{@map[city][0]}" if silver == 1
        puts "      Found #{silver} ounces of silver in #{@map[city][0]}" if silver > 1
        @silver_total += silver
        gold = rand(@chart[city][1]).to_i
        puts "      Found #{gold} ounce of gold in #{@map[city][0]}" if gold == 1
        puts "      Found #{gold} ounces of gold in #{@map[city][0]}" if gold > 1
        @gold_total += gold
        puts "      Found no precious metals in #{@map[city][0]}" if silver.zero? && gold.zero?
        break if silver.zero? && gold.zero?
      end
    else
      loop do
        @days_mined += 1
        silver = rand(@chart[city][0]).to_i
        puts "      Found #{silver} ounces of silver in #{@map[city][0]}" unless silver.zero?
        gold = rand(@chart[city][1]).to_i
        puts "      Found #{gold} ounces of gold in #{@map[city][0]}" unless gold.zero?
        puts "      Found no precious metals in #{@map[city][0]}" if silver.zero? && gold.zero?
        break if silver < 2 && gold < 1
      end
    end
    success
  end

  # Generates random number based on passed in seed.
  def random_number(seed, range)
    seed = seed.to_i
    return nil if seed <= 0
    rng2 = Random.new(seed)
    num = rng2.rand(range) + 1
    num
  end

  # Method that picks the prospectors next location
  def next_location(current_city, seed)
    current_city = current_city.to_i
    return nil if current_city < 0 || current_city >= 7
    range = 1
    range = @map[current_city].length - 1 unless @map[current_city].length <= 1
    next_city = random_number(seed, range).to_i

    next_city += 1 if next_city.zero?
    return nil if next_city.nil?
    if @visited_locations < 5
      print "Heading from #{@map[current_city][0]} to #{@map[current_city][next_city]}"
      print ", holding #{@silver_total} ounces of silver and #{@gold_total} ounces of gold."
      puts
    end

    # Gets next_city location on map to return
    @visited_locations += 1
    city = @map_finder.get_city_index(@map[current_city][next_city])
    city
  end

  # Method to keep track of prospectors locations visited.
  # Should always return 1
  def location_count
    1
  end

  # Method that initalizes chart with gold/silver possibilities
  # Index 0 = silver, Index 1 = gold
  def set_gold_chart
    @chart = [[0, 2], [0, 3], [0, 4], [0, 5], [3, 3], [5, 0], [10, 0]]
  end

  # Method to display prospectors results
  def see_results(prospector)
    prospector = prospector.to_i
    return nil if prospector <= 0
    puts "\n\n"

    puts "After #{@days_mined} days prospector ##{prospector} returned to San Francisco with:"
    if @silver_total == 1
      puts "      #{@silver_total} ounce of silver"
    else
      puts "      #{@silver_total} ounces of silver"
    end
    if @gold_total == 1
      puts "      #{@gold_total} ounce of gold"
    else
      puts "      #{@gold_total} ounces of gold"
    end

    puts "      Heading home with $#{calculate_money(@silver_total, @gold_total)}"
    puts "\n\n"
    1
  end

  # Method to calculate price of gold and silver collected
  def calculate_money(silver, gold)
    return nil if silver.is_a?(String) || gold.is_a?(String) || silver < 0 || gold < 0
    silver_price = 1.31 * silver
    gold_price = 20.67 * gold
    total = silver_price + gold_price
    format('%0.2f', total)
  end
end
