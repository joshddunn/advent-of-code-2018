require_relative './input.rb'

class AlchemicalReduction

  def polymer(initial = nil, final = INPUT)
    alphabet = ('a'..'z')
    until initial == final
      initial = final
      alphabet.each do |letter|
        final = final.gsub("#{letter}#{letter.upcase}", '')
        final = final.gsub("#{letter.upcase}#{letter}", '')
      end
    end
    final.length
  end

  def shortest
    alphabet = ('a'..'z')
    values = []
    alphabet.each do |letter|
      values.push polymer(nil, INPUT.gsub(/[#{letter}#{letter.upcase}]/, ''))
    end
    values.min
  end

end
