require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
     puts "Exact Matches: #{@secret_code.num_exact_matches(code)}"
     puts "Near Matches: #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    print "Enter a code"
    guess_code = Code.from_string(gets.chomp)
    print_matches(guess_code)
    return @secret_code == guess_code
  end
end
