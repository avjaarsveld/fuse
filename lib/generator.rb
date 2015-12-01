require 'optparse'
require 'active_support/core_ext/integer/inflections'
require_relative 'table_printer'
require_relative 'prime_number_calculator'
require_relative 'matrix_generator'

class Generator
  def initialize
    @options = {}

    OptionParser.new do |opts|
      opts.banner = "Usage: prime_table [options]"

      @options[:count] = 10 # default count

      opts.on("-c", "--count NUMBER") do |count|
        if count.to_i > 0
          @options[:count] = count.to_i
        end
        puts
        puts "Multiplication table for prime numbers up to the #{@options[:count].ordinalize} prime number"
        puts
      end

    end.parse!
  end

  def generate
    @prime_numbers = PrimeNumberCalculator.new(@options[:count]).prime_numbers

    matrix = MatrixGenerator.new(@prime_numbers)

    # Omit `style` (or use something like `style: 'default'`) for default `terminal_table` style table
    TablePrinter.new(:headings => matrix.header, :rows => matrix.rows, style: 'custom').print_to_screen
  end

end