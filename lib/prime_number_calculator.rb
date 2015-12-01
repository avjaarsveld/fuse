class PrimeNumberCalculator

  def initialize (limit)
    @limit = limit
  end

  def prime_numbers
    number_to_check = 2 # only numbers greater than 1 can be prime numbers
    prime_numbers = []

    while prime_numbers.count < @limit do
      if prime?(number_to_check)
        prime_numbers << number_to_check
      end
      number_to_check += 1
    end

    prime_numbers
  end

  private

  def prime?(number)
    # Note: This will not scale well
    (2..number-1).each do |n|
      return false if (number.to_f / n) % 1 == 0
    end
    return true
  end
end
