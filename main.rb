# frozen_string_literal: true

require 'debug'

def calc_position(line, o_pos, x_pos)
  line.each_with_index do |element, idx|
    x_pos += idx if element == 'x'
    o_pos += idx if element == 'o'
  end
end

def result(o_pos, x_pos)
  if (x_pos % 3).zero?
    'x win'
  elsif (o_pos % 3).zero?
    'o win'
  end
end

def who_won?(list)
  return if list.flatten.compact.empty?

  count_of_steps = 0
  x_pos = 0
  o_pos = 0
  list.each do |line|
    next if line.compact.empty?

    count_of_steps += 1
    calc_position(line, o_pos, x_pos)
  end

  result(o_pos, x_pos) if count_of_steps >= 3
end

_x_win_diagonal = [['x', 'o', nil], [nil, 'x', 'o'], [nil, nil, 'x']]
_x_win_horizontal = [%w[x x x], ['o', 'o', nil], [nil, nil, nil]]
_o_win_vertical = [['x', nil, 'o'], [nil, 'x', 'o'], ['x', nil, 'o']]
_nothing_win = [['x', 'o', nil],
                %w[x x o],
                %w[o x o]]
x_one_step = [['x', nil, nil], [nil, nil, nil], [nil, nil, nil]]

p who_won?(x_one_step)
