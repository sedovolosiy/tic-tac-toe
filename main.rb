# frozen_string_literal: true

require 'debug'

def add_pos_steps(count_of_steps, idx, pos)
  pos += idx
  count_of_steps += 1
  [pos, count_of_steps]
end

def calc_position(line, o_pos, x_pos, count_of_steps)
  line.each_with_index do |element, idx|
    case element
    when 'x'
      x_pos, count_of_steps = add_pos_steps(count_of_steps, idx, x_pos)
    when 'o'
      o_pos, count_of_steps = add_pos_steps(count_of_steps, idx, o_pos)
    end
  end
  [x_pos, o_pos, count_of_steps]
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

    x_pos, o_pos, count_of_steps = calc_position(line, o_pos, x_pos, count_of_steps)
  end

  result(o_pos, x_pos) if count_of_steps >= 3
end

x_win_diagonal = [['x', 'o', nil], [nil, 'x', 'o'], [nil, nil, 'x']]
_x_win_horizontal = [%w[x x x], ['o', 'o', nil], [nil, nil, nil]]
_o_win_vertical = [['x', nil, 'o'], [nil, 'x', 'o'], ['x', nil, 'o']]
_nothing_win = [['x', 'o', nil],
                %w[x x o],
                %w[o x o]]
_x_one_step = [%w[x x o], [nil, nil, nil], [nil, nil, nil]]

p who_won?(x_win_diagonal)
