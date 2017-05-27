require 'rest-client'

$server_addr = "http://localhost:4567"

def abonner(receiver, write)
  Thread.new do
    puts "Starter å lytte etter meldinger til #{receiver}"
    message = nil
    while true do
      begin
        t = RestClient.get("#{$server_addr}/#{receiver}")
        if message != t 
          message = t
          write.call(receiver, message)
        end
        sleep 2
      rescue
      end
    end
  end
end

def send_melding(receiver, message)
  begin
    puts "sender melding til #{receiver}"
    5.times do 
      print "."
      sleep 0.2
    end
    puts ""
    print "> "
    RestClient.put("#{$server_addr}/#{receiver}/#{URI.encode(message)}", {}, {})
  rescue
    puts "feilet å sende melding"
  end
end

$alfabet = ("a".."z").to_a
$alfabet << 'æ'
$alfabet << 'ø'
$alfabet << 'å'

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
