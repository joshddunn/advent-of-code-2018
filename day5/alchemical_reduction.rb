require_relative './input.rb'

class AlchemicalReduction

  def polymer(letter = nil)
    input = INPUT.split('')
    unreducible = []

    input.each do |i|
      next if i.downcase == letter
      if unreducible.length == 0 || i == unreducible.last || i.downcase != unreducible.last.downcase
        unreducible.push i
      else
        unreducible.pop
      end
    end

    unreducible.length
  end

  def shortest
    alphabet = ('a'..'z')
    values = []
    alphabet.each do |letter|
      values.push polymer(letter)
    end
    values.min
  end

end
