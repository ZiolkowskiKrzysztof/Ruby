require "anagram"

describe Anagram do

  describe "match" do   
    it "no matches" do
      detector = Anagram.new("diaper")
      anagrams = detector.match(["hello", "world", "zombies", "pants"])
      expected = []
      expect(anagrams).to eq(expected)
    end
    
    it "detects two anagrams" do
      detector = Anagram.new("master")
      anagrams = detector.match(["stream", "pigeon", "maters"])
      expected = ["maters", "stream"]
      expect(anagrams.sort).to eq(expected)
    end

    it "does not detect anagram subsets" do
      detector = Anagram.new("good")
      anagrams = detector.match(["dog", "goody"])
      expected = []
      expect(anagrams).to eq(expected)
    end

    it "detects anagram" do
      detector = Anagram.new("listen")
      anagrams = detector.match(["enlists", "google", "inlets", "banana"])
      expected = ["inlets"]
      expect(anagrams).to eq(expected)
    end
    
    it "detects three anagrams" do
      detector = Anagram.new("allergy")
      anagrams = detector.match(["gallery", "ballerina", "regally", "clergy", "largely", "leading"])
      expected = ["gallery", "largely", "regally"]
      expect(anagrams.sort).to eq(expected)
    end
    
    it "does not detect non anagrams with identical checksum" do
      detector = Anagram.new("mass")
      anagrams = detector.match(["last"])
      expected = []
      expect(anagrams).to eq(expected)
    end

    it "detects anagrams case insensitively" do
      detector = Anagram.new("Orchestra")
      anagrams = detector.match(["cashregister", "Carthorse", "radishes"])
      expected = ["Carthorse"]
      expect(anagrams).to eq(expected)
    end

    it "detects anagrams using case insensitive subject" do
      detector = Anagram.new("Orchestra")
      anagrams = detector.match(["cashregister", "carthorse", "radishes"])
      expected = ["carthorse"]
      expect(anagrams).to eq(expected)
    end
    
    it "detects anagrams using case insensitive possible matches" do
      detector = Anagram.new("orchestra")
      anagrams = detector.match(["cashregister", "Carthorse", "radishes"])
      expected = ["Carthorse"]
      expect(anagrams).to(eq(expected))
    end

    it "does not detect a anagram if the original word is repeated" do
      detector = Anagram.new("go")
      anagrams = detector.match(["go Go GO"])
      expected = []
      expect(anagrams).to(eq(expected))
    end

    it "anagrams must use all letters exactly once" do
      detector = Anagram.new("tapper")
      anagrams = detector.match(["patter"])
      expected = []
      expect(anagrams).to eq(expected)
    end

    it "words are not anagrams of themselves case insensitive" do
      detector = Anagram.new("BANANA")
      anagrams = detector.match(["BANANA", "Banana", "banana"])
      expected = []
      expect(anagrams).to eq(expected)
    end
  
  end
end
