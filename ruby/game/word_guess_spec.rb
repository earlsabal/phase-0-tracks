require_relative 'word_guess'

describe Word_guess do
  let(:word_guess) { Word_guess.new }

  it "rejects word if the length is less than 3" do
    word_guess.generate_word("as")
    expect(word_guess.word).to eq ""
  end

  it "rejects word if the word contains a number" do
    word_guess.generate_word("a22s")
    expect(word_guess.word).to eq ""
  end

  it "rejects word if the word contains a symbol" do
    word_guess.generate_word("asf#")
    expect(word_guess.word).to eq ""
  end

  it "rejects word if the word contains a space" do
    word_guess.generate_word("a s")
    expect(word_guess.word).to eq ""
  end

  it "checks if the game meets requirements for a word" do
    word_guess.generate_word("hello")
    expect(word_guess.word).to eq "hello"
  end

  it "checks if the game creates the right amount of guesses" do
    word_guess.generate_word("hello")
    word_guess.generate_guesses
    expect(word_guess.guesses).to eq 10
  end

  it "checks if the game won't count previous guesses" do
    word_guess.guess("h")
    guesses_after_first_guess = word_guess.guesses_left
    word_guess.guess("h")
    expect(word_guess.guesses == guesses_after_first_guess).to eq true
  end

  it "checks if the game will reveal guessed letters" do
    word_guess.guess("h")
    expect(word_guess.revealed_letters).to eq "h _ _ _ _"
  end

  it "checks if the game will work if the player loses" do
    expect(word_guess.end_game).to eq "Congratulations! You won!"
  end

  it "checks if the game will work if the player wins" do
    expect(word_guess.end_game).to eq "HA HA HA YOUUU LOOOOSSSEEE!"
  end
end