require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

# Enable CORS
configure do
  enable :cross_origin
end

# Allow cross-origin requests
before do
  response.headers["Access-Control-Allow-Origin"] = "*"
end

# Handle CORS preflight requests
options "*" do
  response.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Content-Type"
  200
end

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

    # 🚀 Ensure at least one number is present
    if nums.empty? || numbers.scan(/\d/).empty?
      raise "Invalid format detected: #{numbers}"
    end

    negatives = nums.select { |n| n.negative? }
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.sum
  end
end

# String Calculator API
post '/calculate' do
  begin
    data = JSON.parse(request.body.read)
    result = StringCalculator.add(data["numbers"])
    { result: result }.to_json
  rescue StandardError => e
    status 400
    { error: e.message }.to_json
  end
end
