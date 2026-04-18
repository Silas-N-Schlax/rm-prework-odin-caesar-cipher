require_relative "../lib/cipher"

describe CaesarCipher do
  subject(:cipher) { described_class.new }
  describe "#user_shift_index" do
    context "when shift index input is" do
      before do
        invalid_input = "g"
        valid_input = "5"
        allow(cipher).to receive(:gets).and_return(invalid_input, valid_input)
      end
      it "invalid input, then valid input and loops once" do
        message = "What is the shift index you want to use? (Cannot be equal to 0)"
        expect(cipher).to receive(:puts).with(message).twice
        cipher.user_shift_index
      end
    end

    context "when shift index input is" do
      before do
        valid_input = "5"
        allow(cipher).to receive(:gets).and_return(valid_input)
      end
      it "valid, and returns message one time" do
        message = "What is the shift index you want to use? (Cannot be equal to 0)"
        expect(cipher).to receive(:puts).with(message).once
        cipher.user_shift_index
      end

      it "valid, returns input as Integar." do
        expect(cipher.user_shift_index).to be(5)
      end
    end
  end

  describe "#shift_alphabet" do
    context "when shift index is a valid Integar" do
      it "return shifted alphabet when input positive" do
        expect(cipher.shift_alphabet(5)).to eq(%w[f g h i j k l m n o p q r s t u v w x y z a b c d e])
      end
      it "return shifted alphabet when input is negative" do
        expect(cipher.shift_alphabet(-5)).to eq(%w[v w x y z a b c d e f g h i j k l m n o p q r s t u])
      end
    end
  end

  describe "#shift_text" do
    context "returns ciphered text when valid input and shift is 5 and text" do
      it "includes no spaces or special characters" do
        input = "bob"
        expected = "gtg"
        expect(cipher.shift_text(input, 5)).to eq(expected)
      end
      it "includes spaces" do
        input = "hello world"
        expected = "mjqqt btwqi"
        expect(cipher.shift_text(input, 5)).to eq(expected)
      end
      it "includes special characters" do
        input = "hello! world!"
        expected = "mjqqt! btwqi!"
        expect(cipher.shift_text(input, 5)).to eq(expected)
      end
      it "includes spaces, special characters, and is case sensitive" do
        input = "HellO wor!d!"
        expected = "MjqqT btw!i!"
        expect(cipher.shift_text(input, 5)).to eq(expected)
      end
    end
  end
end
