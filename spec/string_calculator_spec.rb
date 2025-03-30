require_relative '../app'
require 'rspec'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple numbers" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it "handles new lines as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "handles new lines as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom single-character delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for malformed input with consecutive delimiters" do
      expect { StringCalculator.add("//-\n1-2--3") }.to raise_error("Invalid format detected: 1-2--3")
    end

    it "raises an error for negative numbers" do
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    end

    it "raises an error if the delimiter declaration is malformed (missing newline)" do
      expect { StringCalculator.add("//;1;2") }.to raise_error("Invalid format: missing newline after delimiter declaration")
    end    
  end
end
