require 'scorer'

describe Scorer do
  before(:each) do
    @scorer = Scorer.new
  end

  it "records the roll of the bowling ball" do
    @scorer.roll(1)
    @scorer.roll(0)
    @scorer.score.should eq 1
  end

  it "records the score of a roll within a frame" do
    @scorer.roll(1)
    @scorer.roll(8)
    @scorer.score.should eq 9
  end

  it "records the bonus from a spare" do
    @scorer.roll(1)
    @scorer.roll(9)
    @scorer.roll(9)
    @scorer.roll(0)
    @scorer.score.should eq 28
  end

  it "records the bonus from a strike" do
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.score.should eq 60
  end
  it "records the bonus from a strike ending with < 10 frame" do
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(2)
    @scorer.roll(3)
    @scorer.score.should eq 72
  end
  it "records the score from a full game ending with < 10 frame" do
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(2)
    @scorer.roll(3)
    @scorer.score.should eq 252
  end
  it "records the score from a full game ending with spare frame and one bonus" do
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(2)
    @scorer.roll(8)
    @scorer.roll(10)
    @scorer.score.should eq 272
  end
  it "records the score from a full game ending with a double bonus" do
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.roll(10)
    @scorer.score.should eq 300

  end
end
