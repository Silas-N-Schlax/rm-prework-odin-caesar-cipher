

def get_user_text_cipher
  puts "What text would you like me to add a Caesar Cipher to?"
  gets.chomp
end

def get_user_shift_index
  puts "What is the shift index you want to use? (Cannot be equal to 0)"
  input = gets.chomp.to_i
  get_user_shift_index() if input === 0
  input
end

def shift_alphabet(shift)
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  alphabet.rotate(shift)
end

def shift_text (text, shift)
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  shifted_alphabet = shift_alphabet(shift)
  p shifted_alphabet
  text = text.split("")

  for i in 0..text.length-1 do
    if alphabet.include?(text[i].downcase)
      idx = alphabet.index(text[i].downcase)
      if text[i] === alphabet[idx]
        text[i] = shifted_alphabet[idx]
      else
        text[i] = shifted_alphabet[idx].upcase
      end
    end
  end
  text.join("")
end 


def run
  text = get_user_text_cipher
  shift = get_user_shift_index
  shifted_text = shift_text(text, shift)
  p shifted_text
end


run()