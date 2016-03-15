class Game
  def welcome
    puts "Welcome to Guessing Game."
    puts "Before we can get started, please enter your name below."
    print ">> "
    @user_name = gets.chomp
    puts "Welcome, #{@user_name}! The rules today are simple."
    puts "You have five chances to guess a number between 1 and 100."
    puts "Good luck!"
    random_number
    number_collection
    guessing_loop
  end

  def random_number
    sleep 2
    @comp_num = (rand(1..100))
    puts "The computer has chosen its number. Now, it's your turn."
  end

  def number_collection
    puts "Enter a number between one and one hundred."
    print ">> "
    @user_num = gets.chomp.to_i
  end


  def guessing_loop
    @number_of_guesses = 0
    @previous_nums = []
    loop do
      if @number_of_guesses == 4
        puts "Sorry. You're out of turns, #{@user_name}. The number was #{@comp_num}."
        puts "Better luck next time! 😊"
        exit
      elsif @previous_nums.include? @user_num
        puts "Are you ok? You already guessed that number. 🤔"
        @number_of_guesses += 1
        number_collection
      elsif @user_num < @comp_num
        puts "Your number is too low. Guess a higher number. 👆"
        @number_of_guesses += 1
        @previous_nums.push(@user_num)
        number_collection
      elsif @user_num > @comp_num
        puts "Your number is too high. Guess a lower number. 👇"
        @number_of_guesses += 1
        @previous_nums.push(@user_num)
        number_collection
      elsif @user_num == @comp_num
        puts "You got it, #{@user_name}! 💃"
        exit
      else
        puts "That number is not within the correct range. 😑"
        @number_of_guesses += 1
        @previous_nums.push(@user_num)
        number_collection
      end
    end
  end
end

Game.new.welcome
