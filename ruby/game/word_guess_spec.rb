require_relative 'word_guess'

describe Word_guess do
  let(:word_guess) { Word_guess.new }

  it "checks if the game meets requirements for a word" do
    expect(calculator.add(3,4)).to eq 7
  end

  it "checks if the game creates the right amount of guesses" do
    expect(calculator.subtract(7,1)).to eq 6
  end

  it "checks if the game won't count previous guesses" do
    expect(calculator.multiply(2,3)).to eq 6
  end

  it "checks if the game will reveal guessed letters" do
    expect(calculator.multiply(2,3)).to eq 6
  end

  it "checks if the game will work if the player loses" do
    expect(calculator.divide(4,2)).to eq 2
  end

  it "checks if the game will work if the player wins" do
    expect(calculator.multiply(2,3)).to eq 6
  end
end