class Year

  attr_reader :year

  def initialize(year)
    @year = year
  end

  def leap_year?
    return true if @year % 4 == 0 && @year % 100 == 0 && @year % 400 == 0
    return true if @year % 4 == 0 && @year % 100 != 0
    false
  end
end
