def all_letters_occur(str)
  str = str.downcase
  h = Hash.new(0)
  str.each_char {|c| h[c]+=1 if ('a'..'z').include?c}
  if (h.length == 26)
    return true
  end
  return false
end

print all_letters_occur("abcd")