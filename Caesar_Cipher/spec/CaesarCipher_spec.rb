require './lib/CaesarCipher'

describe "cipher" do

    it "shifts a given input by a given factor" do
      expect(cipher("hello", 3)).to eql("khoor")
    end

    it "preserves capital letters" do
      expect(cipher("helloWorld", 3)).to eql("khoorZruog")
    end

    it "preserves the location of non-letter characters" do
      expect(cipher("Hello, my World! Error 404", 3)).to eql("Khoor, pb Zruog! Huuru 404")
    end

    it "handles a given input if a given factor is zero" do
      expect(cipher("error", 0)).to eql("error")
    end

    it "wraps around z" do
      expect(cipher("zoo", 2)).to eql("bqq")
    end
    
    it "handles a bad factor input" do
      expect{cipher("shifts a given input", "foo")}.to raise_error(ArgumentError)
    end
    
    it "handles a numeric input" do
      expect(cipher("12345", 4)).to eql("12345")
    end

end
