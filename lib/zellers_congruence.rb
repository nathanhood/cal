class ZellersCongruence
  DAYS_INDEX = [6, 0, 1, 2, 3, 4, 5]

  def self.calculate(month, year)
    if month == 1 || month == 2
      month += 12
      year -= 1
    end
    result = (1 + (((month + 1) * 26) / 10).floor + year + (year/4).floor + 6*(year/100).floor + (year/400).floor) % 7
    return DAYS_INDEX[result]
  end

end
