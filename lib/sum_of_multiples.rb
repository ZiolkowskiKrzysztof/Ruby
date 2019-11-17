=begin
Write your code for the 'Sum Of Multiples' exercise in this file. Make the tests in
`sum_of_multiples_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sum-of-multiples` directory.
=end

class SumOfMultiples
    attr_reader :numbers
    def initialize(*numbers); @numbers = numbers; end
  
    def to(num)
      numbers.flat_map {  |nummy| (1..num - 1).to_a.select {  |number| number % nummy == 0 } }.uniq.inject(&:+).to_i
    end
  end