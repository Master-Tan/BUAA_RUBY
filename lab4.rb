def decode_ways(code)
  cnt = [1]
  flag = 0
  if code % 10 != 0
    cnt << 1
  else
    cnt << 0
  end
  pass = code % 10
  code /= 10
  while code != 0
    if code % 10 != 0
      if (code % 10) * 10 + pass <= 26
        cnt << cnt[-1] + cnt[-2]
      else
        cnt << cnt[-1]
      end
    else
      cnt << 0
    end
    pass = code % 10
    code /= 10
  end
  cnt[-1]
end