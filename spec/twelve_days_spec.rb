require "twelve_days"

describe TwelveDays do
  describe "returns" do
  
    it "the whole song" do
      song_file = File.expand_path("../src/song.txt", "twelve_days_test.rb")
      expected = IO.read(song_file)
      expect(TwelveDays.song).to(eq(expected))
    end
    
  end
end
