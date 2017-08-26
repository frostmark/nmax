require "nmax/version"

module Nmax
  def self.execute(text, n)

    unless n > 0
      puts 'argument invalid'
      return
    end

    numbers = text.scan(/\d+/).map(&:to_i).sort

    if numbers.any?
      if n < numbers.size
        puts numbers[-n..-1]
      else
        puts numbers
      end
    else
      puts 'numbers has not found'
    end

  end
end
