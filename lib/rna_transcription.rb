=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end

class Complement
  
  def self.of_dna(strand)
    strand.split('').map do |nucleotide|
      complements[nucleotide]
    end.join('')
  end
  
  def self.of_rna(strand)
    strand.split('').map do |nucleotide|
      complements.invert[nucleotide]
    end.join('')
  end
  
  def self.complements
    {
      "G" => "C",
      "C" => "G",
      "T" => "A",
      "A" => "U"
    }
  end
  
end
