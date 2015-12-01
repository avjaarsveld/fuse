require 'terminal-table'

class TablePrinter

  def initialize (data)
    @table = Terminal::Table.new

    case data[:style]
    when 'custom'
      @table.style = {:border_x => '', :border_y => '', :border_i => ''}

      data = inject_spacer_column(data)

      @table.add_row data[:headings] if data[:headings]
      @table.add_row custom_separator if data[:headings]
      data[:rows].each do |r|
        @table.add_row r
      end
    else
      @table.headings = data[:headings] if data[:headings]
      @table.add_separator if data[:headings]
      @table.rows = data[:rows] if data[:rows]
    end

  end

  def print_to_screen
    puts table
  end

  def table
    @table
  end

  private

  def inject_spacer_column(data)
    new_data = {}
    new_data[:headings] = inject_spacer_in_row(data[:headings], spacer_char = '|') if data[:headings]
    new_data[:rows] = data[:rows].collect{|row| inject_spacer_in_row(row, spacer_char = '|') }
    new_data
  end

  def inject_spacer_in_row(row, spacer_char = '|')
    new_row = []
    new_row << row.shift
    new_row << spacer_char
    new_row + row
  end

  def custom_separator
    separator = []
    arr_x = (0...@table.number_of_columns).to_a.map do |i|
      separator << '-' * (@table.column_width(i) + @table.cell_padding)
    end
    separator[1] = '+'
    separator
  end

end