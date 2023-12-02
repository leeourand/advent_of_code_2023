Game = Data.define(:id, :rounds)
Round = Data.define(:red, :green, :blue)

MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

games = File.read('inputs/2.txt').split("\n").map do |game|
  game_id_input, round_input = game.split(':')
  id = Integer(game_id_input.match(/^Game (\d+)/).captures.first)
  rounds = round_input.split(';').map do |round|
    red = round.match(/(\d+) red/)&.captures&.first.to_i
    green = round.match(/(\d+) green/)&.captures&.first.to_i
    blue = round.match(/(\d+) blue/)&.captures&.first.to_i
    Round.new(red:, green:, blue:)
  end
  Game.new(id:, rounds:)
end

valid_games = games.select do |game|
  game.rounds.all? do |round|
    round.red <= MAX_RED && round.green <= MAX_GREEN && round.blue <= MAX_BLUE
  end
end

part1 = valid_games.sum(&:id)

part2 = games.map do |game|
  [game.rounds.map(&:red).max, game.rounds.map(&:green).max, game.rounds.map(&:blue).max].reduce(1) { _1 * _2 }
end.sum

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"
