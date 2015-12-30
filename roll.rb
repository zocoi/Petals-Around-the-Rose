roll_count = 1
correct_guess_count = 0

puts "Welcome to Petals Around the Rose"
puts "Let's start"

def draw_dice_face(num)
  shift_left = (num == 1)?5:(num-2)
  r="-"*5+"\n|"+((a=:ghklm[shift_left])?a.to_i(36).to_s(2).tr("10","o "):"    o").insert(3,"|\n|")
  puts *(r+r[0,14].reverse).split("\n")
end

def calculate_answer(dices)
  answer = dices.map do |num|
    if num == 3
      2
    elsif num == 5
      4
    else
      0
    end
  end
  answer.inject(:+)
end

while correct_guess_count < 6 do
  puts "Roll #{roll_count}:"
  current_dices = Array.new(5) do rand(6) + 1 end
  # puts current_dices
  current_dices.each do |dice|
    draw_dice_face(dice)
  end

  current_answer = calculate_answer(current_dices)

  if roll_count > 5
    puts "You are now warm, let's guess the answer. Enter your answer:"
    your_answer = gets.chomp.to_i
    if your_answer == current_answer
      correct_guess_count += 1
      puts "Correct!"
    else
      puts "Failed! Please try again."
    end
  end

  puts "The answer is: #{calculate_answer(current_dices)}"

  roll_count += 1
  puts "Press Enter to continue next roll..."

  if correct_guess_count > 5
    puts "You guess the correct answer more than 5 times. Looks like you figured it out. Congrats!"
  end
  gets.chomp
end

# puts "How many dice do you want to roll?"
# roll = gets.chomp




# draw_dice_face(1) # 3
# draw_dice_face(2) # 4
# draw_dice_face(3) # 5
# draw_dice_face(4) # 6
# draw_dice_face(5) # 1
# draw_dice_face(6)
