require './spec/spec_helper'
require "./lib/table_printer"
require 'terminal-table'

module Terminal
  describe TablePrinter do

    it "can render custom styled table" do
      @table = TablePrinter.new(headings: ['', 2, 3], rows: [[2, 4, 6],[3, 6, 9]], style: 'custom')
      expect(@table.table.render).to eq "\n     |   2    3   \n --  +  ---  --- \n 2   |   4    6   \n 3   |   6    9   \n"
    end

    it "can render default styled table" do
      @table = TablePrinter.new(headings: ['', 2, 3], rows: [[2, 4, 6],[3, 6, 9]])
      expect(@table.table.render).to eq "+---+---+---+\n|   | 2 | 3 |\n+---+---+---+\n| 2 | 4 | 6 |\n| 3 | 6 | 9 |\n+---+---+---+"
    end
  end
end