require_relative 'Simulator'
require_relative 'check_args'

def show_usage_and_exit
  puts 'Usage:'
  puts 'ruby gold_rush.rb *SEED* *NUMBER OF PROSPECTORS*'
  puts '*SEED* and *NUMBER OF PROSPECTORS* should be a nonnegative integer'
  exit 1
end

# EXECUTION STARTS HERE

# Verify that the arguments are valid
args = CheckArgs.new
valid_args = args.check_args ARGV

# If arguments are valid, start the program
# Otherwise, show proper usage message and exit program
if valid_args
  seed = ARGV[0].to_i
  prospector_count = ARGV[1].to_i
  @sim = Simulator::new seed,prospector_count
  @sim.play
else
  show_usage_and_exit
end
