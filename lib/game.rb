class Game
  attr_reader :number, :answer
  # make it from reader tp attr_accessor later?

  def initialize
    @number = rand(0..100)
    @answer = false
  end

  def start
    "Start Guessing"
  end
end
