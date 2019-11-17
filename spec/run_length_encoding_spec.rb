require "run_length_encoding"

describe RunLengthEncoding do

  describe "encode" do

    it "empty string" do
      input = ""
      output = ""
      expect(RunLengthEncoding.encode(input)).to(eq(output))
    end

    it "single characters only are encoded without count" do
      input = "XYZ"
      output = "XYZ"
      expect(RunLengthEncoding.encode(input)).to(eq(output))
    end

    it "string with no single characters" do
      input = "AABBBCCCC"
      output = "2A3B4C"
      expect(RunLengthEncoding.encode(input)).to(eq(output))
    end

    it "single characters mixed with repeated characters" do
      input = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
      output = "12WB12W3B24WB"
      expect(RunLengthEncoding.encode(input)).to(eq(output))
    end

    it "multiple whitespace mixed in string" do
      input = "  hsqq qww  "
      output = "2 hs2q q2w2 "
      expect(RunLengthEncoding.encode(input)).to(eq(output))
    end

    it "lowercase characters"do
      input = "aabbbcccc"
      output = "2a3b4c"
      expect(RunLengthEncoding.encode(input)).to(eq(output))
    end

  end

  describe "decode" do
    
    it "empty string" do
      input = ""
      output = ""
      expect(RunLengthEncoding.decode(input)).to(eq(output))
    end

    it "single characters only" do
      input = "XYZ"
      output = "XYZ"
      expect(RunLengthEncoding.decode(input)).to(eq(output))
    end

    it "string with no single characters" do
      input = "2A3B4C"
      output = "AABBBCCCC"
      expect(RunLengthEncoding.decode(input)).to(eq(output))
    end

    it "single characters with repeated characters" do
      input = "12WB12W3B24WB"
      output = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
      expect(RunLengthEncoding.decode(input)).to(eq(output))
    end

    it "multiple whitespace mixed in string" do
      input = "2 hs2q q2w2 "
      output = "  hsqq qww  "
      expect(RunLengthEncoding.decode(input)).to(eq(output))
    end

    it "lower case string" do
      input = "2a3b4c"
      output = "aabbbcccc"
      expect(RunLengthEncoding.decode(input)).to(eq(output))
    end

  end
    
  it("consistency encode followed by decode gives original string") do
    input = "zzz ZZ  zZ"
    encoded = RunLengthEncoding.encode(input)
    expect(RunLengthEncoding.decode(encoded)).to(eq(input))
  end
  
end
