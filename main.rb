# frozen_string_literal: true

require 'debug'

WIN_COMBINATIONS = [
  [0, 1, 2], # top_row
  [3, 4, 5], # middle_row
  [6, 7, 8], # bottom_row
  [0, 3, 6], # left_column
  [1, 4, 7], # center_column
  [2, 5, 8], # right_column
  [0, 4, 8], # left_diagonal
  [6, 4, 2] # right_diagonal
].freeze

def final_result(result)
  if WIN_COMBINATIONS.include?(result['x'])
    'x win'
  elsif WIN_COMBINATIONS.include?(result['o'])
    'o win'
  else
    'nothing win'
  end
end

def who_won?(list)
  result = {
    'x' => [],
    'o' => []
  }
  list.flatten.each_with_index do |item, idx|
    next if item.nil?

    result[item] << idx
  end
  final_result(result)
end

x_win_diagonal = [['x', 'o', nil], [nil, 'x', 'o'], [nil, nil, 'x']]
_x_win_horizontal = [%w[x x x], ['o', 'o', nil], [nil, nil, nil]]
_o_win_vertical = [['x', nil, 'o'], [nil, 'x', 'o'], ['x', nil, 'o']]
_nothing_win = [['x', 'o', nil],
                %w[x x o],
                %w[o x o]]
_x_one_step = [%w[x x o], [nil, nil, nil], [nil, nil, nil]]

p who_won?(x_win_diagonal)
