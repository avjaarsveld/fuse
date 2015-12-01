# fuse

Prime Number Generator

Prints a multiplication table of prime numbers, for a given number of prime numbers (defaults to 10).

## Usage

```
bin/prime_table "-c", "--count NUMBER"
```

> For Example: `bin/prime_table -c 10`

## Default vs Custom table styling

The table styling has been customised. For the standard table styling replace
`TablePrinter.new(:headings => matrix.header, :rows => matrix.rows, style: 'custom').print_to_screen`
with
`TablePrinter.new(:headings => matrix.header, :rows => matrix.rows).print_to_screen`
in `lib/generator.rb`
