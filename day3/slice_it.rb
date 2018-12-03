require_relative './input.rb'

class SliceIt

  attr_accessor :fabric

  def initialize
    @fabric = Hash.new(0)
  end

  def overlap
    INPUT.each_line do |input|
      location, size = parse(input)

      size[0].times do |x|
        size[1].times do |y|
          fabric["#{location[0] + x},#{location[1] + y}"] += 1
        end
      end
    end
    fabric.values.select { |v| v > 1 }.count
  end

  def claim
    overlap
    INPUT.each_line do |input|
      location, size, id = parse(input)

      all_unique = true

      size[0].times do |x|
        size[1].times do |y|
          all_unique = false if fabric["#{location[0] + x},#{location[1] + y}"] > 1
        end
      end

      return id if all_unique
    end
  end

  private

  def parse(input)
    id       = input.scan(/\#(.+)\s\@/)[0][0].to_i
    location = input.scan(/@\s(.+):/)[0][0].split(',').map(&:to_i)
    size     = input.scan(/:\s(.+)$/)[0][0].split('x').map(&:to_i)

    return [location, size, id]
  end

end
