require 'Bowling'

When /^I bowl a (\d) with the first roll$/ do |first_roll|
      @rolls = Bowling.new
      @rolls.roll_1 =  first_roll.to_i

end
And /^I bowl a (\d) with the second roll$/ do |second_roll|


  @result = @rolls.roll(@rolls.roll_1)
  @result = @rolls.roll(second_roll.to_i)

end

Then /^the total for the frame is (\d+)$/ do |expected|
  expect(@result[0]+@result[1]).to eq expected.to_i

end



When /^I bowl a strike$/ do
  @rolls = Bowling.new
  @rolls.roll_1 = 10
  @result = @rolls.roll(@rolls.roll_1)

end

And /^bowl a (\d+) and (\d+) in the next frame$/ do |first_roll,second_roll|

  @rolls.roll_1 = first_roll.to_i
  @rolls.roll_1 = @rolls.roll_1+ second_roll.to_i
  @result = @rolls.roll(@rolls.roll_1)
end


When(/^I bowl a spare$/) do
  @rolls = Bowling.new
  @rolls.roll_1 =  10
  @result = @rolls.roll(@rolls.roll_1)
end

And(/^I bowl a (\d+) in the next roll$/) do |first_roll|

  @rolls.roll_1 = first_roll.to_i
  @result = @rolls.roll(@rolls.roll_1)
end







When(/^I bowl (\d+) strikes$/) do |number_of_rolls|
  @roll_game = Bowling.new
  @result = @roll_game.roll_many(10,number_of_rolls.to_i)
  @result = @roll_game.score
end

Then(/^I will have a final score of (\d+)$/) do |final_score|
  expect(@result).to eq final_score.to_i
end

And(/^the 12th roll equals (\d+)$/) do |final_roll|
  @roll_game.roll(final_roll.to_i)
  @result = @roll_game.score
end


When(/^I bowl a (\d+) in every frame$/) do |score_of_the_rolls|
  @roll_game = Bowling.new
  @result = @roll_game.roll_many(score_of_the_rolls.to_i,20)
  @result = @roll_game.score
end

And(/^I bowl (\d+) for the next (\d+) rolls$/) do |score_of_the_rolls, number_of_rolls|
  @roll_game = Bowling.new
  @result = @rolls.roll_many(score_of_the_rolls.to_i,number_of_rolls.to_i)
  @result = @rolls.score
end

And(/^I bowl a (\d+) with the next roll$/) do |next_roll|

  @result = @rolls.roll(next_roll.to_i)
end