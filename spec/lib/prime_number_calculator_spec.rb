require './spec/spec_helper'
require "./lib/prime_number_calculator"

describe PrimeNumberCalculator do
  it 'can calculate the first 10 prime numbers' do
    expect(PrimeNumberCalculator.new(10).prime_numbers).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  it 'can calculate the first 20 prime numbers' do
    expect(PrimeNumberCalculator.new(20).prime_numbers).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]
  end
end