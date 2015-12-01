class MatrixGenerator

  attr_reader :rows, :header

  def initialize(numbers)
    @numbers = numbers
    @header = [''] + numbers
    @rows = matrix
  end

  private

  def matrix
    rows = []
    @numbers.each do |row_value|
      rows << row(row_value)
    end
    rows
  end

  def row(row_value)
    row = [row_value]
    @numbers.each do |column_value|
      row << column_value * row_value
    end
    row
  end

end