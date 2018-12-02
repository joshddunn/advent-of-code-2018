require_relative './input.rb'

class InventoryManagement

  def self.checksum
    two_instances = 0
    three_instances = 0
    INPUT.each do |input|
      letter_count = Hash.new(0)
      input.each_char do |letter|
        letter_count[letter] += 1
      end
      occurrences = letter_count.values
      two_instances   += 1 if occurrences.include? 2
      three_instances += 1 if occurrences.include? 3
    end

    two_instances * three_instances
  end

  def self.common_letters
    string_codes = {}
    INPUT.each do |characters|
      characters.length.times do |index|
        karacters = characters[0...index] + characters[index+1..characters.length]
        key = "#{index}:#{karacters}"
        return karacters if string_codes[key]
        string_codes[key] = true
      end
    end
  end

end
