INPUT_FILENAME = 'inputs/1.txt'

TEST_INPUT = %w[two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2 zoneight234 7pqrstsixteen]
DIGIT_WORDS = %w[one two three four five six seven eight nine]

def value_for(v)
  (DIGIT_WORDS.index(v)&.+ 1) || v.to_i
end

part1 = File.readlines(INPUT_FILENAME).reduce(0) do
  _1 + _2.scan(/\d/).values_at(0, -1).join('').to_i
end

part2 = File.readlines(INPUT_FILENAME).reduce(0) do |a, line|
  regex = Regexp.new("(?=(#{DIGIT_WORDS.join('|')}|\\d))")
  line_value = line.scan(regex).flatten.values_at(0, -1).map { |v| value_for(v) }.join('').to_i
  a + line_value
end

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"
