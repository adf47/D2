require_relative 'Simulator'


def show_usage_and_exit
  puts 'Usage:'
  puts 'ruby gold_rush.rb *SEED* *NUMBER OF PROSPECTORS*'
  puts '*SEED* and *NUMBER OF PROSPECTORS* should be a nonnegative integer'
  exit 1
end

# Returns true if and only if: FIX THIS COMMENT
# 1. There is one and only one argument
# 2. That argument, when converted to an integer, is nonnegative
# Returns false otherwise
# If any errors occur (e.g. args is nil), just return false - we are
# going to exit anyways, so no need for more detailed categorization
# of the error

def check_args(args)
  args.count == 2 && args[0].to_i > 0 && args[1].to_i > 0
rescue StandardError
    false
end

# EXECUTION STARTS HERE

# Verify that the arguments are valid
valid_args = check_args ARGV

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
