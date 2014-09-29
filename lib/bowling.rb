class Bowling
  attr_accessor :roll_1, :frame_1 ,:frame_2, :rolls


def initialize
  @rolls = []
  @score = 0
end

  def pins
    @roll_1
  end

def roll(pins)
  @rolls << pins
end

  def add_score
    @frame_1 + @frame_2
  end

  def score
    frame_index = 0
    #roll_number = 0
  score = 0
    (@rolls).each_index do |roll_number|
      if frame_10(frame_index)
        if last_frame_roll_is_strike(roll_number)
          if @rolls[roll_number+1]!=10 && roll_number < @rolls.length-2
            score += 10 + strike_bonus(roll_number)

          else
          score += 10
          end

          #roll_number += 1
        elsif last_frame_roll_is_spare(roll_number)
          score+= 10 + spare_bonus(roll_number)
         # roll_number+=2
        else
          score+=@rolls[roll_number]
        end

      else
        if roll_is_strike(roll_number)
        score += 10 + strike_bonus(roll_number)
        #roll_number += 1
        elsif roll_is_spare(roll_number)
        score += 10 + spare_bonus(roll_number)
        else
          score += sum_of_rolls_in_frame(roll_number)
        #  roll_number +=2
        end
        frame_index +=1


      end
      puts roll_number

    end
    score
  end

  def last_row_strike_bonus(frame_index)
     if @rolls[frame_index]<@rolls[@rolls.length-2]
       @rolls[frame_index+1] + @rolls[frame_index+2]
     end
  end

  def sum_of_rolls_in_frame(roll_number)
    @rolls[roll_number] + @rolls[roll_number +1]
  end

  def spare_bonus(roll_number)
    @rolls[roll_number+2]
  end

  def roll_is_spare(frame_index)
    @rolls[frame_index] + rolls[frame_index+1]==10
  end

  def last_frame_roll_is_spare(frame_index)
    if @rolls[frame_index]<@rolls[@rolls.length-1]
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
      end
  end

  def frame_10(frame_index)
    frame_index >= 9
  end

  def last_frame_roll_is_strike(frame_index)
    @rolls[frame_index]==10
  end

  def strike_bonus(frame_index)
    @rolls[frame_index+1] + @rolls[frame_index+2]

  end

  def roll_is_strike(frame_index)
    @rolls[frame_index]==10
  end

  def roll_many(pins, number_of_rolls)
    for i in 1..number_of_rolls
      roll(pins)
    end

  end
end