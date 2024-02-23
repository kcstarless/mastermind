module DisplayModule

  def display_secret(secret)
    puts "---------------------------------"
    secret.each do |i|
      print "|   #{i}   "
    end
    print "|"
    puts ""
    puts "---------------------------------"
  end

  def display_guess(guess_history, hint_history)
    puts "---------------------------------"
    guess_history.each_with_index do |v, i|
      v.each do |j|
        print "|   #{j}   "
      end
      print "|"
      hint_history.each_with_index do |x, y|
        x.each_with_index do |z, w|
          if y == i
            if w == 0
              print " #{z.to_s.white} "
            elsif w == 1
              print " #{z.to_s.black} "
            end
          end
        end
      end
      puts ""
    end
    puts "---------------------------------"
  end
end
