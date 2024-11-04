#!/usr/bin/env ruby

VOWELS = ['a', 'e', 'i', 'o', 'u']

def find_vowel_in_array(array=[])
  array.find_index {|char| VOWELS.include?(char) }
end

def pig_latin_word(word="")
  word.downcase!
  
  char_array = word.split('')
  first_vowel_pos = find_vowel_in_array(char_array)
  
  if first_vowel_pos > 0
    front = char_array[0...first_vowel_pos]
    main = char_array[first_vowel_pos..-1]
  else
    front = []
    main = char_array
  end
  
  main.join + front.join + 'ay'
end

def remove_punctuation(word="")
  punctuation = '.,;:!?'.split('')
  if punctuation.include?(word[-1,1])
    word.chop!
  end
  word
end

def pig_latin_setence(sentence="")
  words = sentence.split(' ')
  array = words.map do |word|
    word_no_punct = remove_punctuation(word)
    pig_latin_word(word_no_punct)
  end

  array.join(' ').capitalize + '.'
end

def print_intro
  puts "\n>> Pig Latin Translator <<\n\n"
  puts "Type phrases to translate after each prompt."
  puts "Type 'quit' to exit."
  puts
end

def pig_latin_translator
  print_intro

  loop do
    print "translate: "
    input = gets.chomp
    if input == 'quit'
      exit!
    else
      puts pig_latin_setence(input)
      puts
    end
  end
end

# Launch the translator
pig_latin_translator
