class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    numbers = numbers.gsub("\n", delimiter)
    numbers.split(",").map(&:to_i).sum
  end
end
