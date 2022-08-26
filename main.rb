# frozen_string_literal: true

require 'debug'

WIN_COMBINATIONS_LIST = [
  [0, 1, 2], # top_row
  [3, 4, 5], # middle_row
  [6, 7, 8], # bottom_row
  [0, 3, 6], # left_column
  [1, 4, 7], # center_column
  [2, 5, 8], # right_column
  [0, 4, 8], # left_diagonal
  [6, 4, 2] # right_diagonal
].freeze
X_NAME = 'x'
O_NAME = 'o'

def who_won?(list)
  result = {
    X_NAME => [],
    O_NAME => []
  }
  list.flatten.each_with_index do |item, idx|
    next if item.nil?

    result[item] << idx
    return item if WIN_COMBINATIONS_LIST.include?(result[item])
  end
end

x_win_diagonal = [['x', 'o', nil], [nil, 'x', 'o'], [nil, nil, 'x']]
_x_win_horizontal = [%w[x x x], ['o', 'o', nil], [nil, nil, nil]]
_o_win_vertical = [['x', nil, 'o'], [nil, 'x', 'o'], ['x', nil, 'o']]
_nothing_win = [['x', 'o', nil],
                %w[x x o],
                %w[o x o]]
_x_one_step = [%w[x x o], [nil, nil, nil], [nil, nil, nil]]
_x_y_win_vertical = [['x', nil, 'o'], ['x', nil, 'o'], ['x', nil, 'o']] # unreal case

p who_won?(x_win_diagonal)
