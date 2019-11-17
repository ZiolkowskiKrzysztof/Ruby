=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram

    def initialize(word)
      @word = word.downcase
      @letters = @word.chars.sort
    end
    
    def match(words)
      words.select { |w| w.downcase.chars.sort == @letters and w.downcase != @word }
    end
    
end