require_relative './input.rb'

class ReposeRecord

  def most_sleepy
    guard = sleepy_guard_data.max_by { |_, value| value.sum }

    guard_id = guard[0]
    minute_most_slept = guard[1].index(guard[1].max)

    guard_id * minute_most_slept
  end

  def consistently_sleepy
    guard = sleepy_guard_data
            .map { |key, value| [key, value.index(value.max), value.max] }
            .max_by { |value| value[2] }
    guard[0] * guard[1]
  end

  private

  def sleepy_guard_data
    guard_id = nil
    asleep_at = nil
    data = {}
    INPUT.split("\n").sort.each do |input|
      minutes = parse_minutes(input)
      if input =~ /Guard\s\#(.+)\s/
        guard_id = parse_id(input)
      elsif input =~ /falls asleep/
        asleep_at = minutes
      elsif input =~ /wakes up/
        data[guard_id] = Array.new(60).map(&:to_i) unless data.key? guard_id
        (minutes - asleep_at).times do |m|
          data[guard_id][asleep_at + m] += 1
        end
      end
    end
    data
  end

  def parse_minutes(input)
    input.scan(/\[.+:(.+)\]/)[0][0].to_i
  end

  def parse_id(input)
    input.scan(/Guard\s\#(.+)\s/)[0][0].to_i
  end

end
