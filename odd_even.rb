require 'benchmark'
require 'pry'

# Single return - O(1)
# Constant
def odd_even(number)
  # Modulo Operator
  return number % 2
end

# A simple loop is linear - O(n)
# Linear
def greet(n)
  n.times do |x|
    puts "Hello: #{x}"
  end
end

# Loop within a loop - O(n**2)
# Quadratic
def yo_dawg(num)
  n.times do
    n.times do
      puts "I put a loop in your loop so you can loop while you loop."
    end
  end
end

def factorial(n)
  (1..n).inject(:*)
end

# Asking if num is 0. If it is, return 1.
# if not, it will run the function again after subtracting 1 from n
def factorial_recursive(n)
  n.zero? ? 1 : n * factorial_recursive(n - 1)
end

puts factorial_recursive(4) # This should output 24
# factorial_recursive(4)
# First: N is not zero, so it runs: 4 * result of recursion(n-1)
# Second: n == 3. Right side. 3 * factorial_recursive(2)
# Third:  n == 2. Right side. 2 * factorial_recursive(1)
# Fourth: n == 3. Right side. 1 * factorial_recursive(0)
# Fifth: n== 0. LEFT SIDE. Returns 1
## ON THE WAY BACK ##
# Fifth:  returned 1
# Fourth: 1 * 1 = 1
# Third:  2 * 1 = 2
# Second: 3 * 2 = 6
# First: 4 * 6 = 24

# Stack goes 5 DEEP, then goes back UP

# factorial_recursive(4.1) # Stack level too deep. Never hits a stopping point
# 1: n == 4.1, 4.1 * factorial_recursive(3.1)
# 2: n == 3.1, 3.1 * factorial_recursive(2.1)
# 3: n == 2.1, 2.1 * factorial_recursive(1.1)
# 4: n == 1.1, 1.1 * factorial_recursive(0.1)
# 5: n == 0.1, 0.1 * factorial_recursive(-0.9)

# 6: n == -0.9, -0.9 * factorial_recursive(-1.9)


#Benchmark

m = 10000 # How many times to test

Benchmark.bm(20) do |b|
  b.report('Factorial 1')     {m.times {factorial_recursive(1)}}
  b.report('Factorial 10')     {m.times {factorial_recursive(10)}}
  b.report('Factorial 100')     {m.times {factorial_recursive(100)}}
  # b.report('Factorial 1000')     {m.times {factorial(1000)}}

  # b.report('11:')     {m.times {odd_even(11)}}
  # b.report('111:')     {m.times {odd_even(111)}}
  # b.report('1111:')     {m.times {odd_even(1111)}}
  # puts "...etc"
  # b.report('11111111111111:')     {m.times {odd_even(11111111111111)}}
end
  # `bmbm` first runs the code as a 'rehearsal' to force any initialization that needs to happen,
  # then it forces the GC to run, then it runs the benchmark again 'for real'.
  # This ensures that the system is fully initialized and the benchmark is fair.
