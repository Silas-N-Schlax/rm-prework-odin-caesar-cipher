# Caesar Cipher
class CaesarCipher
  def user_text_cipher
    print "What text would you like me to add a Caesar Cipher to? -> "
    gets.chomp
  end

  def user_shift_index
    print "What is the shift index you want to use? (Cannot be equal to 0) -> "
    input = gets.chomp.to_i
    user_shift_index if input.zero?
    input
  end

  def shift_alphabet(shift)
    alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
    alphabet.rotate(shift)
  end

  def shift_text(text, shift)
    alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
    shifted_alphabet = shift_alphabet(shift)
    text = text.chars

    for i in 0..(text.length - 1) do
      next unless alphabet.include?(text[i].downcase)

      idx = alphabet.index(text[i].downcase)
      text[i] = if text[i] == alphabet[idx]
                  shifted_alphabet[idx]
                else
                  shifted_alphabet[idx].upcase
                end
    end
    text.join
  end

  def run
    text = user_text_cipher
    shift = user_shift_index
    shifted_text = shift_text(text, shift)
    p shifted_text
  end
end

CaesarCipher.new.run
