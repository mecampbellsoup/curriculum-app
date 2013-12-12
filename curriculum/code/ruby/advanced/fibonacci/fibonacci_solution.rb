def fib num

  if num == 0
    0
  elsif num == 1
    1
  else 
    fib(num-1) + fib(num-2)
  end

end