require_relative 'word_guess'

describe Word_guess do
  let(:word_guess) { Word_guess.new }

  it "rejects word if the length is less than 3" do
    word_guess.start_game("as")
    expect(word_guess.word).to eq ""
  end

  it "rejects word if the word contains a number" do
    word_guess.start_game("a22s")
    expect(word_guess.word).to eq ""
  end

  it "rejects word if the word contains a symbol" do
    word_guess.start_game("asf#")
    expect(word_guess.word).to eq ""
  end

  it "rejects word if the word contains a space" do
    word_guess.start_game("a s")
    expect(word_guess.word).to eq ""
  end

  it "checks if the game meets requirements for a word" do
    word_guess.start_game("hello")
    expect(word_guess.word).to eq "hello"
  end

  it "checks if the game creates the right amount of guesses" do
    word_guess.start_game("hello")
    expect(word_guess.guesses).to eq 10
  end

  it "checks if the game rejects a guess" do
    word_guess.start_game("hello")
    expect(word_guess.guess("aa")).to eq false
    expect(word_guess.guess("")).to eq false
    expect(word_guess.guess("1")).to eq false
    expect(word_guess.guess("!")).to eq false
  end

  it "checks if the game won't count previous guesses" do
    word_guess.start_game("hello")
    word_guess.guess("h")
    guesses_after_first_guess = word_guess.guesses
    word_guess.guess("h")
    expect(word_guess.guesses == guesses_after_first_guess).to eq true
  end

  it "checks if the game will generate hidden letters format" do
    word_guess.start_game("hello")
    expect(word_guess.show_revealed_letters).to eq "_ _ _ _ _"
  end

  it "checks if the game will reveal guessed letters" do
    word_guess.start_game("hello")
    word_guess.guess("h")
    expect(word_guess.show_revealed_letters).to eq "h _ _ _ _"
  end

  it "checks if the game will work if the player loses" do
    word_guess.start_game("hello")
    letter = "a"
    while word_guess.is_game_over == false
      word_guess.guess(letter)
      letter = letter.next
    end
    expect(word_guess.end_game_message).to eq "HA HA HA YOUUU LOOOOSSSEEE!"
  end

  it "checks if the game will work if the player wins" do
    letters = ["h", "e", "l", "o"]
    index = 0
    word_guess.start_game("hello")
    while word_guess.is_game_over == false
      word_guess.guess(letters[index]) 
      index += 1     
    end
    expect(word_guess.end_game_message).to eq "Congratulations! You won!"
  end
end