# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  new_string = ""
  count = Hash.new(0)

  str.each_char.with_index  do | char, i |
    count[char] += 1
    if str[i + 1] != str[i] 
      if count[char] > 1
        number_and_letter = count[char].to_s + char.to_s
        new_string += number_and_letter
      else 
        letter = char.to_s 
        new_string += letter
      end
      count[char] = 0 
    end
  end
  new_string
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
