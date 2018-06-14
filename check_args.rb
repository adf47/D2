#Class that checks users input arguments (ARGV) is correct

class CheckArgs

    def check_args(args)
      args.count == 2 && args[0].to_i > 0 && args[1].to_i > 0
    rescue StandardError
        false
    end

end
