require 'rest-client'


def abonner(receiver, write)
  Thread.new do
    puts "Starter å lytte etter meldinger til #{receiver}"
    message = nil
    while true do
      t = RestClient.get("http://localhost:4567/#{receiver}")
      if message != t 
        message = t
        write.call(receiver, message)
      end
      sleep 2
    end
  end
end

def send_melding(receiver, message)
  puts "sender melding til #{receiver}"
  5.times do 
    print "."
    sleep 0.2
  end
  puts ""
  print "> "
  RestClient.put("http://localhost:4567/#{receiver}/#{URI.encode(message)}", {}, {})
end

$alfabet = ("a".."z").to_a
$alfabet << 'æ'
$alfabet << 'ø'
$alfabet << 'å'

def krypter(key, message)
  encrypted = ""
  message.split("").each do |c|
    if ($alfabet.include?(c))
      encrypted << $alfabet[$alfabet.index(c) + key]
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
      decrypted << $alfabet[$alfabet.index(c) - key]
    else
      decrypted << c
    end
  end
  decrypted
end
