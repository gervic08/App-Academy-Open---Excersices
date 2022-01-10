class Player
  def get_move
    puts 'enter a position with coordinates separated with a space like `4 7`'
    input_user = gets.chomp.split(" ")
    input_user.map! { |num| num.to_i }
  end 
end
