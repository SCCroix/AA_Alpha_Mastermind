require "byebug"
class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all?{|peg| POSSIBLE_PEGS.keys.include?(peg.upcase)}
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Did not submit valid pegs"
    end
  end

  def self.random(length)
    random_pegs = []
    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.chars)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, idx|
      if peg == @pegs[idx]
        count += 1
      end
    end
    return count
  end

  def num_near_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, idx|
      if peg != @pegs[idx] && self.pegs.include?(peg)
        count += 1
      end
    end
    return count
  end


  def ==(code)
    num_exact_matches(code) == @pegs.length && @pegs.length == code.length
  end
end # Class end
