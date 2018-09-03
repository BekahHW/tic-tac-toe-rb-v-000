def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def current_player(board)
  turn_count(board)%2 == 0 ? 'X' : 'O'
  end
  
def move(board, index, current_player)
  board[index] = current_player
end

def play(board)
  counter = 0
  until counter == 9
    puts  turn(board)
    counter += 1
  end
end



def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
counter=0
 board.each do |turn|
   if turn == 'X' || turn == 'O'
     counter += 1
end
end
counter
end


def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
end

def move(board, input_to_index, character)
 board[input_to_index] = character
 end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def input_to_index(user_input)
  user_input.to_i - 1
   end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if  (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
return win_combo
end
end
  else
    false
end

def full?(board)
 board.all? do |player|
  player == "X" || player == "O"
end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
    if won?(board)
     board[won?(board)[0]]
  end
end


 WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [2,4,6],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
