def total_price(x)
  if x % 2 == 0
    y = (x / 2) * 30 + ( x / 2) * 30 * 0.5
  else
    y = ((x - 1) / 2 ) * 30 * 0.5 + ((x - 1) / 2) * 30 + 30
  end
  return y
end
