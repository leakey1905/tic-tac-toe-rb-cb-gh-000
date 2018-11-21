# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8],
  [2, 4, 6]
]

# prints the current board representation, 1 argument
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i - 1
  return index
end

def turn_count(board)
  cnt = 9
  board.each do |pos|
    if pos == "" or pos == " " or pos == nil
      cnt -= 1
    end
  end
  return cnt
end

def current_player(board)
  cnt = turn_count(board)
  if cnt % 2 == 0
    return "X"
  else
    return "O"
  end
end

# move the things
def move(board, index, value)
  board[index] = value
  return board
end



def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

def position_taken?(board, index)
  if board[index] == nil or board[index] == "" or board[index] == " "
    return false
  elsif board[index] == "X" or board[index] == "O"
    return true
  end
end

# its my turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
  else
    turn(board)
  end
  display_board(board)
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  i = 0
  while i < 9
    if board[WIN_COMBINATIONS[i][0]] == "X" and board[WIN_COMBINATIONS[i][1]] == "X" and board[WIN_COMBINATIONS[i][2]] == "X"
      return WIN_COMBINATIONS[i]
    elsif board[WIN_COMBINATIONS[i][0]] == "O" and board[WIN_COMBINATIONS[i][1]] == "O" and board[WIN_COMBINATIONS[i][2]] == "O"
      return WIN_COMBINATIONS[i]
    end
    i += 1
  end
rescue NoMethodError
  return false
end

# check whether it is full
def full?(board)
  return board.none?{|pos| pos == " " or pos == "" or pos == nil}
end

# check whether it can be drawn
def draw?(board)
  if not won?(board) and full?(board)
    return true
  elsif not won?(board) and not full?(board)
    return false
  else
    return false
  end
end

# check whether game over
def over?(board)
  if won?(board) or draw?(board) or full?(board)
    return true
  else
    return false
  end
end

# check winner
def winner(board)
  if over?(board)
    i = 0
    while i < 9
      if board[WIN_COMBINATIONS[i][0]] == "X" and board[WIN_COMBINATIONS[i][1]] == "X" and board[WIN_COMBINATIONS[i][2]] == "X"
        return "X"
      elsif board[WIN_COMBINATIONS[i][0]] == "O" and board[WIN_COMBINATIONS[i][1]] == "O" and board[WIN_COMBINATIONS[i][2]] == "O"
        return "O"
      end
      i += 1
    end
  end
end
