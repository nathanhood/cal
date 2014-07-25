require_relative "year"
require_relative "zellers_congruence"

class Month
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"]

  attr_reader :length, :month_array, :year_header
  attr_accessor :year, :month

  def initialize(month, year)
    @month = month
    @year = year
    build_month
  end

  def header
    "#{name} #{year}".center(20).rstrip
  end

  def year_header
    "#{name}".center(20)
  end

  def name()
    MONTHS[@month]
  end

  def length
    month = @month
    l = 30 + (month + (month/8).floor) % 2
    if @month == 2
      unless Year.leap_year?(@year)
        return l -= 2
      end
      return l -= 1
    end
    return l
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    @month_array.each do |week|
      unless week.include?(self.length) || week[6] == nil
        revised_week = week.map do |day|
          if day == nil
            day = "  "
          elsif day > 0 && day < 10
            day = " #{day}"
          else
            day = "#{day}"
          end
        end
      else
        week.delete_if { |day| day == nil }
        revised_week = week.map do |day|
          day = "#{day}"
        end
      end
      final_week = revised_week.join(" ")
      output << "#{final_week}\n"
    end
    return output
  end

  def build_month
    @month_array = []
    6.times do |i|
      @month_array << build_week(i)
    end
    @month_array
  end

  def build_week(index)
    month_start = ZellersCongruence.calculate(@month, year)
    month_length = length
    week = []
    if index == 0
      day_count = 1
      week.insert(month_start, day_count)
      day_count += 1
      (month_start + 1).upto(6) do |i|
        week[i] = day_count
        day_count += 1
      end
    else
      day_count = ((7 * index) - month_start) + 1
      7.times do |i|
        if day_count <= month_length
          week[i] = day_count
        else
          week[i] = nil
        end
        day_count += 1
      end
    end
    return week
  end

end
