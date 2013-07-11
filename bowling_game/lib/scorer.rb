class Scorer
  attr_accessor :roll_count, :frame_score, :spare_flag, :frames, :current_frame

  def initialize
    @rolls = []
    @roll_count = 0
    @frame_score = 0
    @spare_flag = false
    @frames = []
    @current_frame = []
    @cuurent_frame_number = 1
  end

  def roll(pins)
    @current_frame << pins
    if pins == 10 || current_frame.count == 2
      @frames << @current_frame
      @current_frame = []
    end
  end

  def score
    calculated_score = 0
    rolls = @frames.flatten
    roll_count = 0
    frame_count = 0

    @frames.each do |frame|
      frame_count += 1

      calculated_score += frame.reduce(:+)
      roll_count += frame.count
      # look ahead will take care of bonus scoring
      if frame_count < 10
        if frame.reduce(:+) == 10 and frame.count == 2
          calculated_score += get_by_index(rolls, roll_count)
        elsif frame.reduce(:+) == 10 and frame.count == 1
          calculated_score += get_by_index(rolls, roll_count) + get_by_index(rolls, roll_count+1)
        end
      end
    end
    calculated_score
  end

end

def get_by_index rolls, index
  if index < rolls.length
    rolls[index]
  else
    0
  end
end
