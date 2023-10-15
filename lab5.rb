def create_hash(keys, values)
  h = Hash.new
  i = 1
  for i in 0...keys.size
    h[keys[i]] = values[i]
  end
  h
end

# if __FILE__ == $0
#   puts create_hash(%w{a b c d}, ["1", "2", "3", "4"])
# end
