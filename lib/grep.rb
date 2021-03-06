=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

class Grep
    
    def self.grep(pattern, flags, files)
        [].tap do |results|
            files.each do |file|
                File.read(file).lines.each_with_index do |line, index|
                    matcher = Regexp.new(
                        flags.include?("-x") ? "^#{pattern}$" : pattern,
                        (Regexp::IGNORECASE if flags.include?("-i")))
                    next unless line.match?(matcher) ^ flags.include?("-v")
                    break results << file if flags.include?("-l")
                    results << [
                        ("#{file}:" unless files.one?),
                        ("#{index.succ}:" if flags.include?("-n")),
                        line.rstrip].join
                end
            end
        end.join("\n")
    end
    
end
