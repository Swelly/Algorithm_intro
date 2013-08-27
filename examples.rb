# Blocks are not objects in Ruby
# Cannot set a block to a variable
def bank_bloc(num)
  return "Total of $" + num.to_s
end
# puts bank_bloc(50)

# Procs are objects!
# Setting a local variable to hold a function (Block of code)

# Lambda is an Anon function in Ruby
class Person
  def sing()
    return "Singing Lalalala"
  end
end
p1 = Person.new()
puts p1.sing()

# Recursive factorial algorithm
# Proc
# Lambda
