class Questions
  def initialize(name)
    @num1 = rand(20)
    @num2 = rand(20)
    @solution = @num1 + @num2 
    puts "Question for #{name}: what is the sum of #{@num1} and #{@num2}?"
  end

  def check_answer(response)
    if (response.to_i == @solution)
      return true
    end 
    return false 
  end  
end 
