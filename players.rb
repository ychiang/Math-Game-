class Player
  attr_reader :name, :lives
  def initialize(name) 
    # puts "what's your name?"
    @name = name
    @lives = 3
  end

  def lose_life() 
    if (!self.dead?())
      @lives -= 1
    end 
    @lives
  end 

  def dead?()
    if (self.lives == 0)
      return true
    end
    return false
  end 
end






