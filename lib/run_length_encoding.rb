=begin
Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
`run_length_encoding_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/run-length-encoding` directory.
=end

class RunLengthEncoding
    
    def self.encode(string)
        string.chars.chunk { |c| c }.inject("") do |str, (char, seq)|
            if seq.length > 1
                str << seq.length.to_s + char
            else
                str << char
            end
        end
    end

    def self.decode(string)
        string.scan(/(\d+)?(.)/).inject("") do |str, (count, char)|
            times = count ? count.to_i : 1
            str << char * times
        end
    end
end