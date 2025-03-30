class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)

      # 🚀 Ensure input format includes a newline after delimiter declaration
      unless parts[1]
        raise "Invalid format: missing newline after delimiter declaration"
      end

      delimiter = parts[0][2..]
      numbers = parts[1]
    end
    numbers = numbers.gsub("\n", delimiter)

    # 🚀 Check for consecutive delimiters
    if numbers.match?(/#{Regexp.escape(delimiter)}{2,}/)
      raise "Invalid format detected: #{numbers}"
    end
    
    nums = numbers.split(delimiter).map(&:to_i)
    nums.sum
  end
end
