def all_words_capitalized?(words)
	words.all? { |word| word == word.capitalize}
end

def no_valid_url?(urls)
	thats = [".com",".net",".io",".org"]
  urls.none? { |url| thats.include?("." + url.split(".")[1]) }
end

def any_passing_students?(students)
	students.any? do |student| 
    grades = student[:grades].inject{ |sum, el| sum+el }.to_f
    good_average = grades/student[:grades].length >= 75
  end 
end