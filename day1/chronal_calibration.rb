require_relative './input.rb'

class ChronalCalibration

  attr_accessor :frequency, :frequencies, :duplicate

  def initialize
    @duplicate = nil
    @frequencies = { 0 => true }
    @frequency = 0
  end

  def first_duplicate
    resulting_frequency until duplicate
    duplicate
  end

  def resulting_frequency
    INPUT.each do |value|
      @frequency += value.to_i
      if frequencies.key?(frequency) && !duplicate
        @duplicate = frequency
      else
        frequencies[frequency] = true
      end
    end
    frequency
  end

end
