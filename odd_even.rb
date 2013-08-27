require 'benchmark'

# Constant - O(1)
def odd_even(number)
  # Modulo Operator
  return number % 2
end

# A simple loop is linear - O(n)
def greet(n)
  n.times do |x|
    puts "Hello: #{x}"
  end
end

# Loop within a loop - O(n**2)
def yo_dawg(num)
  n.times do
    n.times do
      puts "I put a loop in your loop so you can loop while you loop."
    end
  end
end

def factorial
end

#Benchmark

m = 100_000 # How many times to test

Benchmark.bm(20) do |b|
  b.report('11:')     {m.times {odd_even(11)}}
  b.report('111:')     {m.times {odd_even(111)}}
  b.report('1111:')     {m.times {odd_even(1111)}}
  puts "...etc"
  b.report('11111111111111:')     {m.times {odd_even(11111111111111)}}
end
  # `bmbm` first runs the code as a 'rehearsal' to force any initialization that needs to happen,
  # then it forces the GC to run, then it runs the benchmark again 'for real'.
  # This ensures that the system is fully initialized and the benchmark is fair.
