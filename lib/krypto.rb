def krypter(key, message)
  encrypted = ""
  message.split("").each do |c|
    if ($alfabet.include?(c))
      encrypted << $alfabet[($alfabet.index(c) + key) % $alfabet.size]
    else
      encrypted << c
    end
  end
  encrypted
end

def dekrypter(key, message)
  decrypted = ""
  message.split("").each do |c|
    if ($alfabet.include?(c))
      decrypted << $alfabet[($alfabet.index(c) - key) % $alfabet.size]
    else
      decrypted << c
    end
  end
  decrypted
end

