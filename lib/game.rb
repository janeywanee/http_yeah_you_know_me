class Game
  attr_reader :answer

  def initialize
    @answer = rand(0..100)
  end

  def start
    "Start Guessing"
  end
end
