=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end

class HighScores
    
    attr_reader :scores, :latest, :personal_best, :personal_top_three

    def initialize(score_list)
        @scores = score_list
        @latest = score_list.last
        @personal_best = score_list.max
        @personal_top_three = score_list.max(3)
    end

    def latest_is_personal_best?
        @personal_best == @latest ? (return true) : (return false)
    end

end