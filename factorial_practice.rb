require 'benchmark'
require 'pry'

def factorial(number)
  # binding.pry
  # puts("Enter a non negative integer: ")
  # number = gets.to_i
  product = 1

  for i in (1..number)
    product = product * (i+1)
    # puts "product is #{product}"
  end
end

m = 20 # How many times to test

Benchmark.bm(20) do |b|
  b.report('Factorial 1')     {m.times {factorial(1)}}
  b.report('Factorial 10')     {m.times {factorial(10)}}
  b.report('Factorial 100')     {m.times {factorial(100)}}
  b.report('Factorial 1000')     {m.times {factorial(1000)}}
end
