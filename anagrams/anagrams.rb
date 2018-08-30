require 'byebug'

class String

  def first_anagram?(other_string)
    self.permutations.include?(other_string)
  end

  def permutations # "ab"
    return [self] if self.length <= 1

    add_element(self[0...-1].permutations, self[-1]) # ["a"], "b"
  end

  def add_element(strings, el) # ["a"], "i"
    answer = []
    strings.each do |string| # "a"
      string.chars.each_index do |idx| # 0
        # byebug
        answer << string[0...idx] + el + string[idx..-1]
      end
      answer << string + el
    end
    answer
  end

  def second_anagram?(other_string)
    self.chars.each do |letter|
      letter_i = other_string.index(letter)
      if letter_i
        other_string = other_string[0...letter_i] + other_string[letter_i + 1..-1]
      else
        false
      end
    end
    other_string.empty? ? true : false
  end

  def third_anagram?(other_string)
    return false unless self.length == other_string.length
    self.chars.sort == other_string.chars.sort
  end

  def fourth_anagram?(other_string)
    self_hsh = Hash.new(0)
    other_hsh = Hash.new(0)
    self.each_char do |letter|
      self_hsh[letter] += 1
    end
    other_string.each_char do |letter|
      other_hsh[letter] += 1
    end
    self_hsh == other_hsh
  end

  def fifth_anagram?(other_string)
    count_hsh = Hash.new(0)
    self.each_char do |letter|
      count_hsh[letter] += 1
    end
    other_string.each_char do |letter|
      count_hsh[letter] -= 1
    end
    count_hsh.values.all? {|v| v == 0 }
  end

end

if __FILE__ == $PROGRAM_NAME

  str1 = "ab"
  str2 = "ba"
  p str1.fifth_anagram?(str2)
  p "elvis".fifth_anagram?("lives")
end
