
class Year

  attr_reader :year, :year_array

  def initialize(year)
    @year = year
    @year_array = build_year(year)
  end

  def build_year(year)
    year_array = []
    1.upto(12) do |i|
      month = Month.new(i, year)
      month.build_month
      year_array << month
    end
    return year_array
  end

  def header
    "#{@year}".center(64).rstrip
  end

  def to_s
    output = header
    output << "\n\n"
    4.times do |i|
      month_headers = []
      month_week = []
      month_days = []
      3.times do |j|
        month_headers << @year_array[(j+(i*3))].year_header
      end
      3.times do |k|
        month_week << "Su Mo Tu We Th Fr Sa"
      end
      6.times do |y|
        line = []
        3.times do |w|
          week = @year_array[(w+(i*3))].month_array[y].map do |day|
            if day == nil
              day = "  "
            elsif day > 0 && day < 10
              day = " #{day}"
            else
              day = "#{day}"
            end
          end
          final_week = week.join(" ")
          line << final_week
        end
        final_line = line.join("  ").rstrip
        final_line << "\n"
        month_days << final_line
      end
      final_header = month_headers.join("  ").rstrip + "\n"
      final_week = month_week.join("  ") + "\n"
      output << final_header
      output << final_week
      month_days.each do |line|
        output << line
      end
    end
    output
  end

  def self.leap_year?(year)
    return true if year % 4 == 0 && year % 100 == 0 && year % 400 == 0
    return true if year % 4 == 0 && year % 100 != 0
    false
  end
end
