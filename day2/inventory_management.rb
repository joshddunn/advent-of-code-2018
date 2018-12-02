require_relative './input.rb'

class InventoryManagement

  def initialize
    @two_instances = 0
    @three_instances = 0
  end

  def checksum
    INPUT.each do |input|
      letter_count = Hash.new(0)
      input.each_char do |letter|
        letter_count[letter] += 1
      end
      occurrences = letter_count.values
      @two_instances   += 1 if occurrences.include? 2
      @three_instances += 1 if occurrences.include? 3
    end

    @two_instances * @three_instances
  end

  def common_letters
    string_codes = Hash.new(0)
    INPUT.each do |input|
      characters = input.split('')
      characters.length.times do |index|
        karacters = characters.dup
        karacters.delete_at(index)
        string_codes["#{index}:#{karacters.join('')}"] += 1
      end
    end
    string_codes.find { |_, val| val > 1 }.first.split(':').last
  end

end
